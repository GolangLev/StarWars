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
	CreateFilm(film entities.Film) (int, error)
	GetAllFilms() ([]entities.Film, error)
	GetFilmById(filmId int) (entities.Film, error)
	DeleteFilm(filmId int) error
	UpdateFilm(filmId int, film entities.UpdateFilm) error
}

type Heroes interface {
	CreateHero(hero entities.Hero) (int, error)
	GetAllHeroes() ([]entities.HeroJoin, error)
	GetHeroById(heroId int) (entities.HeroJoin, error)
	DeleteHero(heroId int) error
	UpdateHero(heroId int, hero entities.UpdateHero) error
}

type Fractions interface {
	CreateFraction(fraction entities.Fraction) (int, error)
	GetAllFraction() ([]entities.Fraction, error)
	GetFractionById(fractionId int) (entities.Fraction, error)
	DeleteFraction(fractionId int) error
	UpdateFraction(fractionId int, fraction entities.UpdateFraction) error
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
		News:      NewNewsService(repo.News),
		Games:     NewGameService(repo.Games),
		Heroes:    NewHeroService(repo.Heroes),
		Films:     NewFilmService(repo.Films),
		Fractions: NewFractionService(repo.Fractions),
	}
}
