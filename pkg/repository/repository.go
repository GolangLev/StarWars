package repository

import "github.com/jmoiron/sqlx"

type Games interface {
}

type Films interface {
}

type Heroes interface {
}

type Fractions interface {
}

type News interface {
}

type Repository struct {
	Games
	Films
	Heroes
	Fractions
	News
}

func NewRepository(db *sqlx.DB) *Repository {
	return &Repository{
		News: NewNewsRepository(db),
	}
}
