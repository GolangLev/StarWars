package service

import (
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/GolangLev/Goland/StarWars/pkg/repository"
)

type FractionService struct {
	repo repository.Fractions
}

func NewFractionService(repo repository.Fractions) *FractionService {
	return &FractionService{repo: repo}
}

func (f *FractionService) CreateFraction(fraction entities.Fraction) (int, error) {
	return f.repo.CreateFraction(fraction)
}

func (f *FractionService) GetAllFraction() ([]entities.Fraction, error) {
	return f.repo.GetAllFraction()
}

func (f *FractionService) GetFractionById(fractionId int) (entities.Fraction, error) {
	return f.repo.GetFractionById(fractionId)
}

func (f *FractionService) DeleteFraction(fractionId int) error {
	return f.repo.DeleteFraction(fractionId)
}

func (f *FractionService) UpdateFraction(fractionId int, fraction entities.UpdateFraction) error {
	return f.repo.UpdateFraction(fractionId, fraction)
}
