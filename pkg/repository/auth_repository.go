package repository

import (
	"fmt"
	"github.com/GolangLev/Goland/StarWars/internal/database"
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/jmoiron/sqlx"
)

type AuthRepository struct {
	db *sqlx.DB
}

func NewAuthRepository(db *sqlx.DB) *AuthRepository {
	return &AuthRepository{db: db}
}

func (a *AuthRepository) CreateUser(user entities.Users) (int, error) {
	var id int

	query := fmt.Sprintf("INSERT INTO %s (nick_name, side, rank, color_sword, type_sword, login, password) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id", database.TableUsers)
	row := a.db.QueryRow(query, user.NickName, user.Side, user.Rank, user.ColorSword, user.TypeSword, user.Login, user.Password)
	if err := row.Scan(&id); err != nil {
		return 0, err
	}

	return id, nil
}

func (a *AuthRepository) GetUser(login, password string) (entities.Users, error) {
	var user entities.Users
	query := fmt.Sprintf("SELECT id FROM %s WHERE login = $1 AND password = $2", database.TableUsers)
	err := a.db.Get(&user, query, login, password)

	return user, err
}

func (a *AuthRepository) GetUserByLoginAndPassword(login, password string) (int, error) {
	var id int
	query := fmt.Sprintf("SELECT id FROM %s WHERE login = $1 AND password = $2", database.TableUsers)
	err := a.db.Get(&id, query, login, password)

	return id, err
}
