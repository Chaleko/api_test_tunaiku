package main

func rateForInstallment(month int) float64 {
	var _rate float64

	switch month {
	case 12:
		_rate = 1.68
	case 18:
		_rate = 1.68
	case 24:
		_rate = 1.59
	case 30:
		_rate = 1.59
	case 36:
		_rate = 1.59
	}

	return _rate
}
