package service

import (
	"errors"
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/GolangLev/Goland/StarWars/internal/server"
	"github.com/GolangLev/Goland/StarWars/pkg/repository"
	"github.com/dgrijalva/jwt-go"
	"time"
)

var _user entities.Users

const (
	signingKey = "#21321k12njblnN$"
	tokenTTL   = 12 * time.Hour
)

type AuthService struct {
	repo repository.Authorization
}

func NewAuthService(repo repository.Authorization) *AuthService {
	return &AuthService{repo: repo}
}

func (a *AuthService) CreateUser(user entities.Users) (int, error) {
	if err := user.Validate(); err != nil {
		return 0, err
	}
	user.Password = user.HashPassword(user.Password)
	return a.repo.CreateUser(user)
}

func (a *AuthService) SignInUser(login, password string) (string, error) {
	user, err := a.repo.GetUser(login, _user.HashPassword(password))
	if err != nil {
		return "", err
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, &server.TokenClaims{
		StandardClaims: jwt.StandardClaims{
			ExpiresAt: time.Now().Add(tokenTTL).Unix(),
			IssuedAt:  time.Now().Unix(),
		},
		UserId: user.Id,
	})

	return token.SignedString([]byte(signingKey))
}

func (a *AuthService) GetUserByLoginAndPassword(login, password string) (int, error) {
	return a.repo.GetUserByLoginAndPassword(login, _user.HashPassword(password))
}

func (a *AuthService) ParseToken(accessToken string) (int, error) {
	token, err := jwt.ParseWithClaims(accessToken, &server.TokenClaims{}, func(token *jwt.Token) (interface{}, error) {
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, errors.New("invalid signing method")
		}

		return []byte(signingKey), nil
	})

	if err != nil {
		return 0, err
	}

	claims, ok := token.Claims.(*server.TokenClaims)
	if !ok {
		return 0, errors.New("token claims are not type *tokenClaims")
	}

	return claims.UserId, nil
}
