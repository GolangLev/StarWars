package repository

import (
	"fmt"
	"github.com/GolangLev/Goland/StarWars/internal/database"
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/jmoiron/sqlx"
)

type HeroRepository struct {
	db *sqlx.DB
}

func NewHeroRepository(db *sqlx.DB) *HeroRepository {
	return &HeroRepository{db: db}
}

func (h *HeroRepository) CreateHero(hero entities.Hero) (int, error) {
	var id int

	query := fmt.Sprintf("INSERT INTO %s (name, description, id_fraction) VALUES ($1, $2, $3) RETURNING id", database.TableHeroes)
	row := h.db.QueryRow(query, hero.Name, hero.Description, hero.IdFraction)
	if err := row.Scan(&id); err != nil {
		return 0, err
	}

	return id, nil
}

func (h *HeroRepository) GetAllHeroes() ([]entities.HeroJoin, error) {
	var hero []entities.HeroJoin

	query := fmt.Sprintf("SELECT h.id, h.name, h.description, f.name_fraction FROM %s h LEFT JOIN %s f on h.id_fraction = f.id", database.TableHeroes, database.TableFractions)
	err := h.db.Select(&hero, query)

	return hero, err
}

func (h *HeroRepository) GetHeroById(heroId int) (entities.HeroJoin, error) {
	var hero entities.HeroJoin

	query := fmt.Sprintf("SELECT h.id, h.name, h.description, f.name_fraction FROM %s h LEFT JOIN %s f on h.id_fraction = f.id WHERE h.id = $1", database.TableHeroes, database.TableFractions)
	err := h.db.Get(&hero, query, heroId)

	return hero, err
}

func (h *HeroRepository) DeleteHero(heroId int) error {
	query := fmt.Sprintf("DELETE FROM %s WHERE id = $1", database.TableHeroes)
	_, err := h.db.Exec(query, heroId)

	return err
}

func (h *HeroRepository) UpdateHero(heroId int, hero entities.UpdateHero) error {
	query := fmt.Sprintf("UPDATE %s SET name = $1, description = $2, id_fraction = $3 WHERE id = $4", database.TableHeroes)
	_, err := h.db.Exec(query, hero.Name, hero.Description, hero.IdFraction, heroId)

	return err
}
