package service

import (
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
