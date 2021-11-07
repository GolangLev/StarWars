package service

import (
	"github.com/GolangLev/Goland/StarWars/internal/entities"
	"github.com/GolangLev/Goland/StarWars/pkg/repository"
)

type NewsService struct {
	repo repository.News
}

func NewNewsService(repo repository.News) *NewsService {
	return &NewsService{repo: repo}
}

func (n *NewsService) CreateNews(news entities.News) (int, error) {
	return n.repo.CreateNews(news)
}

func (n *NewsService) GetAllNews() ([]entities.News, error) {
	return n.repo.GetAllNews()
}

func (n *NewsService) GetNewsById(newsId int) (entities.News, error) {
	return n.repo.GetNewsById(newsId)
}

func (n *NewsService) DeleteNews(newsId int) error {
	return n.repo.DeleteNews(newsId)
}

func (n *NewsService) UpdateNews(newsId int, news entities.UpdateNews) error {
	return n.repo.UpdateNews(newsId, news)
}
