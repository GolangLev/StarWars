package entities

// Hero модель таблицы "heroes"
type Hero struct {
	Id          int    `json:"id" db:"id"`
	Name        string `json:"name" db:"name"`
	Description string `json:"description" db:"description"`
	IdFraction  int    `json:"id_fraction" db:"id_fraction"`
}

type UpdateHero struct {
	Name        *string `json:"name" db:"name"`
	Description *string `json:"description" db:"description"`
	IdFraction  *int    `json:"id_fraction" db:"id_fraction"`
}

type HeroJoin struct {
	Id           int    `json:"id" db:"id"`
	Name         string `json:"name" db:"name"`
	Description  string `json:"description" db:"description"`
	NameFraction string `json:"name_fraction" db:"name_fraction"`
}
