package repository

import (
	"fmt"
	"github.com/GolangLev/Goland/StarWars/internal/database"
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/jmoiron/sqlx"
)

type ProfileRepository struct {
	db *sqlx.DB
}

func NewProfileRepository(db *sqlx.DB) *ProfileRepository {
	return &ProfileRepository{db: db}
}

func (p *ProfileRepository) GetUserById(userId int) (entities.Users, error) {
	var user entities.Users

	query := fmt.Sprintf("SELECT * FROM %s WHERE id = $1", database.TableUsers)
	err := p.db.Get(&user, query, userId)
	return user, err
}

func (p *ProfileRepository) UpdateProfile(userId int, user entities.UpdateProfile) error {
	query := fmt.Sprintf("UPDATE %s SET nick_name = $1, side = $2, rank = $3, color_sword = $4, type_sword = $5 WHERE id = $6", database.TableUsers)
	_, err := p.db.Exec(query, user.NickName, user.Side, user.Rank, user.ColorSword, user.TypeSword, userId)

	return err
}
