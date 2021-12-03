package repository

import (
	"fmt"
	"github.com/GolangLev/Goland/StarWars/internal/database"
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/jmoiron/sqlx"
)

type FractionRepository struct {
	db *sqlx.DB
}

func NewFractionRepository(db *sqlx.DB) *FractionRepository {
	return &FractionRepository{db: db}
}

func (r *FractionRepository) CreateFraction(fraction entities.Fraction) (int, error) {
	var id int

	query := fmt.Sprintf("INSERT INTO %s (name_fraction, description) VALUES ($1, $2) RETURNING id", database.TableFractions)
	row := r.db.QueryRow(query, fraction.NameFraction, fraction.Description)
	if err := row.Scan(&id); err != nil {
		return 0, err
	}

	return id, nil
}

func (r *FractionRepository) GetAllFraction() ([]entities.Fraction, error) {
	var fraction []entities.Fraction

	query := fmt.Sprintf("SELECT * FROM %s ORDER BY id ASC", database.TableFractions)
	err := r.db.Select(&fraction, query)

	return fraction, err
}

func (r *FractionRepository) GetFractionById(fractionId int) (entities.Fraction, error) {
	var fraction entities.Fraction

	query := fmt.Sprintf("SELECT * FROM %s WHERE id = $1", database.TableFractions)
	err := r.db.Get(&fraction, query, fractionId)

	return fraction, err
}

func (r *FractionRepository) DeleteFraction(fractionId int) error {
	query := fmt.Sprintf("DELETE FROM %s WHERE id = $1", database.TableFractions)
	_, err := r.db.Exec(query, fractionId)

	return err
}

func (r *FractionRepository) UpdateFraction(fractionId int, fraction entities.UpdateFraction) error {
	query := fmt.Sprintf("UPDATE %s SET name_fraction = $1, description = $2 WHERE id = $3", database.TableFractions)
	_, err := r.db.Exec(query, fraction.NameFraction, fraction.Description, fractionId)

	return err
}
