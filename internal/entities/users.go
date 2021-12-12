package entities

import (
	"crypto/sha1"
	"errors"
	"fmt"
)

const salt = "1@12@#$12!@#@!q1awe21"

type Users struct {
	Id         int    `json:"id" db:"id"`
	NickName   string `json:"nick_name" db:"nick_name"`
	Side       string `json:"side" db:"side"`
	Rank       string `json:"rank" db:"rank"`
	ColorSword string `json:"color_sword" db:"color_sword"`
	TypeSword  string `json:"type_sword" db:"type_sword"`
	Login      string `json:"login" db:"login"`
	Password   string `json:"password" db:"password"`
}

func (u *Users) HashPassword(password string) string {
	hash := sha1.New()
	hash.Write([]byte(password))

	return fmt.Sprintf("%x", hash.Sum([]byte(salt)))
}

type SignInInput struct {
	Login    string `json:"login" binding:"required"`
	Password string `json:"password" binding:"required"`
}

type ResponseAuthUser struct {
	Id    int    `json:"user_id"`
	Token string `json:"token"`
}

func (u Users) Validate() error {
	if u.NickName == "" && u.Side == "" && u.Rank == "" && u.ColorSword == "" && u.TypeSword == "" && u.Login == "" && u.Password == "" {
		return errors.New("create structure has no values")
	}
	return nil
}
