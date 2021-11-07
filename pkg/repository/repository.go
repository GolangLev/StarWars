package repository

import (
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/jmoiron/sqlx"
)

type Games interface {
}

type Films interface {
}

type Heroes interface {
}

type Fractions interface {
}

type News interface {
	CreateNews(news entities.News) (int, error)
	GetAllNews() ([]entities.News, error)
	GetNewsById(newsId int) (entities.News, error)
	DeleteNews(newsId int) error
	UpdateNews(newsId int, news entities.UpdateNews) error
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
