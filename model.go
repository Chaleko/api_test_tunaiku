package main

type loanEntities struct {
	Date      string `form:"date" json:"date,omitempty"`
	Ktp       string `form:"ktp" json:"ktp,omitempty"`
	Birthdate string `form:"birthdate" json:"birthdate,omitempty"`
	Gender    string `form:"gender" json:"gender,omitempty"`
	Name      string `form:"name" json:"name,omitempty"`
	Ammount   string `form:"ammount" json:"ammount,omitempty"`
	Period    string `form:"period" json:"period,omitempty"`
}

type resInsertLoan struct {
	Status  string `json:"status"`
	Ktp     string `json:"ktp"`
	Message string `json:"message"`
}

type averageEntities struct {
	Count   int     `form:"count" json:"count,omitempty"`
	Summary float32 `form:"summary" json:"summary,omitempty"`
	Average float32 `form:"average" json:"7-day avg,omitempty"`
}

type resAverage struct {
	Status  string
	Message string
	Data    []averageEntities
}

type installmentEntities struct {
	Month    int     `form:"month" json:"month,omitempty"`
	DueDate  string  `form:"duedate" json:"duedate,omitempty"`
	Capital  float64 `form:"capital" json:"capital,omitempty"`
	Interest float64 `form:"interest" json:"interest,omitempty"`
	Total    float64 `form:"total" json:"total,omitempty"`
}

type resInstallment struct {
	Status        string
	Message       string
	Data          []installmentEntities
	TotalCapital  float64
	TotalInterest float64
	GrandTotal    float64
}
