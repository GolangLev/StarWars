package entities

// Fraction модель таблицы "Fractions"
type Fraction struct {
	Id           int    `json:"id" db:"id"`
	NameFraction string `json:"name_fraction" db:"name_fraction"`
	Description  string `json:"description" db:"description"`
}

type UpdateFraction struct {
	NameFraction *string `json:"name_fraction" db:"name_fraction"`
	Description  string  `json:"description" db:"description"`
}
