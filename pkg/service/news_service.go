package service

import "github.com/GolangLev/Goland/StarWars/pkg/repository"

type NewsService struct {
	repo repository.News
}

func NewNewsService(repo repository.News) *NewsService {
	return &NewsService{repo: repo}
}
