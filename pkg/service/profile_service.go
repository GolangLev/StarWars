package service

import (
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/GolangLev/Goland/StarWars/pkg/repository"
)

type ProfileService struct {
	repo repository.Profile
}

func NewProfileService(repo repository.Profile) *ProfileService {
	return &ProfileService{repo: repo}
}

func (p *ProfileService) GetUserById(userId int) (entities.Users, error) {
	return p.repo.GetUserById(userId)
}

func (p *ProfileService) UpdateProfile(userId int, user entities.UpdateProfile) error {
	if err := user.ValidateData(); err != nil {
		return err
	}
	return p.repo.UpdateProfile(userId, user)
}
