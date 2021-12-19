package service

import (
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/GolangLev/Goland/StarWars/pkg/repository"
)

type CommentsService struct {
	repo repository.Comments
}

func NewCommentsService(repo repository.Comments) *CommentsService {
	return &CommentsService{repo: repo}
}

func (c *CommentsService) CreateComment(comment entities.Comments) (int, error) {
	return c.repo.CreateComment(comment)
}
