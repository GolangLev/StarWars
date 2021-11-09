package service

import (
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/GolangLev/Goland/StarWars/pkg/repository"
)

type HeroService struct {
	repo repository.Heroes
}

func NewHeroService(repo repository.Heroes) *HeroService {
	return &HeroService{repo: repo}
}

func (h *HeroService) CreateHero(hero entities.Hero) (int, error) {
	return h.repo.CreateHero(hero)
}

func (h *HeroService) GetAllHeroes() ([]entities.Hero, error) {
	return h.repo.GetAllHeroes()
}

func (h *HeroService) GetHeroById(heroId int) (entities.HeroJoin, error) {
	return h.repo.GetHeroById(heroId)
}

func (h *HeroService) DeleteHero(heroId int) error {
	return h.repo.DeleteHero(heroId)
}

func (h *HeroService) UpdateHero(heroId int, hero entities.UpdateHero) error {
	return h.repo.UpdateHero(heroId, hero)
}
