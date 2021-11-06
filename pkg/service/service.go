package service

import "github.com/GolangLev/Goland/StarWars/pkg/repository"

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

type Service struct {
	Games
	Films
	Heroes
	Fractions
	News
}

func NewService(repo *repository.Repository) *Service {
	return &Service{
		News: NewNewsService(repo.News),
	}
}
