package repository

import (
	"fmt"
	"github.com/GolangLev/Goland/StarWars/internal/database"
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/jmoiron/sqlx"
)

type FilmsRepository struct {
	db *sqlx.DB
}

func NewFilmsRepository(db *sqlx.DB) *FilmsRepository {
	return &FilmsRepository{db: db}
}

func (f *FilmsRepository) CreateFilm(film entities.Film) (int, error) {
	var id int

	query := fmt.Sprintf("INSERT INTO %s (title, subtitle, description, years) VALUES ($1, $2, $3, $4) RETURNING id", database.TableFilms)
	row := f.db.QueryRow(query, film.Title, film.SubTitle, film.Description, film.Years)
	if err := row.Scan(&id); err != nil {
		return 0, err
	}

	return id, nil
}

func (f *FilmsRepository) GetAllFilms() ([]entities.Film, error) {
	var game []entities.Film

	query := fmt.Sprintf("SELECT * FROM %s", database.TableFilms)
	err := f.db.Select(&game, query)

	return game, err
}

func (f *FilmsRepository) GetFilmById(filmId int) (entities.Film, error) {
	var film entities.Film

	query := fmt.Sprintf("SELECT * FROM %s WHERE id = $1", database.TableFilms)
	err := f.db.Get(&film, query, filmId)

	return film, err
}

func (f *FilmsRepository) DeleteFilm(filmId int) error {
	query := fmt.Sprintf("DELETE FROM %s WHERE id = $1", database.TableFilms)
	_, err := f.db.Exec(query, filmId)

	return err
}

func (f *FilmsRepository) UpdateFilm(filmId int, film entities.UpdateFilm) error {
	query := fmt.Sprintf("UPDATE %s SET title = $1, subtitle = $2, description = $3, years = $4 WHERE id = $5", database.TableFilms)
	_, err := f.db.Exec(query, film.Title, film.SubTitle, film.Description, film.Years, filmId)

	return err
}
