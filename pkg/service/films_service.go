package service

import (
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/GolangLev/Goland/StarWars/pkg/repository"
)

type FilmService struct {
	repo repository.Films
}

func NewFilmService(repo repository.Films) *FilmService {
	return &FilmService{repo: repo}
}

func (f *FilmService) CreateFilm(film entities.Film) (int, error) {
	return f.repo.CreateFilm(film)
}

func (f *FilmService) GetAllFilms() ([]entities.Film, error) {
	return f.repo.GetAllFilms()
}

func (f *FilmService) GetFilmById(filmId int) (entities.Film, error) {
	return f.repo.GetFilmById(filmId)
}

func (f *FilmService) DeleteFilm(filmId int) error {
	return f.repo.DeleteFilm(filmId)
}

func (f *FilmService) UpdateFilm(filmId int, film entities.UpdateFilm) error {
	return f.repo.UpdateFilm(filmId, film)
}
