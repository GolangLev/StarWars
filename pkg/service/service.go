package service

import (
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/GolangLev/Goland/StarWars/pkg/repository"
)

type Games interface {
	CreateGames(games entities.Game) (int, error)
	GetAllGames() ([]entities.Game, error)
	GetGamesById(gameId int) (entities.Game, error)
	DeleteGames(gameId int) error
	UpdateGames(gameId int, game entities.UpdateGames) error
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

type Service struct {
	Games
	Films
	Heroes
	Fractions
	News
}

func NewService(repo *repository.Repository) *Service {
	return &Service{
		News:  NewNewsService(repo.News),
		Games: NewGameService(repo.Games),
	}
}
