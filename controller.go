package main

import (
	"encoding/json"
	"math"
	"net/http"
	"strconv"
	"strings"
	"time"
)

func testFunction(w http.ResponseWriter, r *http.Request) {
	var _res resInsertLoan

	_res.Status = "Valid"
	_res.Ktp = "working call this function"

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(_res)
}

func insertLoan(w http.ResponseWriter, r *http.Request) {
	var _res resInsertLoan
	var _loan loanEntities

	db := connectmysql()
	defer db.Close()

	json.NewDecoder(r.Body).Decode(&_loan)

	if (loanEntities{}) != _loan {
		_flag := true
		_arrKtp := strings.Split(_loan.Ktp, "")
		_arrBirthDate := strings.Split(_loan.Birthdate, "")

		_areaKtp := strings.Join(_arrKtp[0:6], "")
		_birthdateDayKtp := strings.Join(_arrKtp[6:8], "")
		_birthdateMonthKtp := strings.Join(_arrKtp[8:10], "")
		_birthdateYearktp := strings.Join(_arrKtp[10:12], "")

		_birthdateDay := strings.Join(_arrBirthDate[8:10], "")
		_birthdateMonth := strings.Join(_arrBirthDate[5:7], "")
		_birthdateYear := strings.Join(_arrBirthDate[2:4], "")

		stmtOut, err := db.Prepare("SELECT AreaCode FROM tbl_area WHERE AreaCode = ? ")
		if err != nil {
			_flag = false
			_res.Status = "InValid"
			_res.Ktp = _loan.Ktp
			_res.Message = err.Error()
		}
		defer stmtOut.Close()

		var _resArea string
		if _flag != false {
			err = stmtOut.QueryRow(_areaKtp).Scan(&_resArea)
			if err != nil {
				_flag = false
				_res.Status = "InValid"
				_res.Ktp = _loan.Ktp
				_res.Message = err.Error()
			}
		}

		if _flag != false {
			if _resArea != _areaKtp {
				_flag = false
				_res.Status = "Invalid"
				_res.Ktp = _loan.Ktp
				_res.Message = "ID Number Is Not Acceptable"
			}
		}

		if _flag != false {
			_intBirthDateDayKtp, err := strconv.Atoi(_birthdateDayKtp)
			if err != nil {
				_flag = false
				_res.Status = "Invalid"
				_res.Ktp = _loan.Ktp
				_res.Message = err.Error()
			}

			_intBirthDateInput, err := strconv.Atoi(_birthdateDay)
			if err != nil {
				_flag = false
				_res.Status = "Invalid"
				_res.Ktp = _loan.Ktp
				_res.Message = err.Error()
			}

			if _loan.Gender == "Male" {
				if (_intBirthDateDayKtp >= 1) && (_intBirthDateDayKtp <= 31) {
					if _intBirthDateDayKtp != _intBirthDateInput {
						_flag = false
						_res.Status = "Invalid"
						_res.Ktp = _loan.Ktp
						_res.Message = "Birthdate is not matching with ID"
					}
				} else {
					_flag = false
					_res.Status = "Invalid"
					_res.Ktp = _loan.Ktp
					_res.Message = "Gender is not matching with ID"
				}
			} else if _loan.Gender == "Female" {
				_intBirthDateInput = _intBirthDateInput + 40
				if (_intBirthDateDayKtp >= 41) && (_intBirthDateDayKtp <= 71) {
					if _intBirthDateDayKtp != _intBirthDateInput {
						_flag = false
						_res.Status = "Invalid"
						_res.Ktp = _loan.Ktp
						_res.Message = "Birthdate is not matching with ID"
					}
				} else {
					_flag = false
					_res.Status = "Invalid"
					_res.Ktp = _loan.Ktp
					_res.Message = "Gender is not matching with ID"
				}
			} else {
				_flag = false
				_res.Status = "Invalid"
				_res.Ktp = _loan.Ktp
				_res.Message = "Gender is not spesifie"
			}
		}

		if _flag != false {
			_intBirthdayMonthKtp, err := strconv.Atoi(_birthdateMonthKtp)
			if err != nil {
				_flag = false
				_res.Status = "Invalid"
				_res.Ktp = _loan.Ktp
				_res.Message = err.Error()
			}

			_intBirthdayMonthInput, err := strconv.Atoi(_birthdateMonth)
			if err != nil {
				_flag = false
				_res.Status = "Invalid"
				_res.Ktp = _loan.Ktp
				_res.Message = err.Error()
			}

			if (_intBirthdayMonthKtp >= 1) && (_intBirthdayMonthKtp <= 12) {
				if _intBirthdayMonthKtp != _intBirthdayMonthInput {
					_flag = false
					_res.Status = "Invalid"
					_res.Ktp = _loan.Ktp
					_res.Message = "Birthdate is not matching with ID"
				}
			} else {
				_flag = false
				_res.Status = "Invalid"
				_res.Ktp = _loan.Ktp
				_res.Message = "ID Number Is Not Acceptable"
			}
		}

		if _flag != false {
			_intBirthdayYearKtp, err := strconv.Atoi(_birthdateYearktp)
			if err != nil {
				_flag = false
				_res.Status = "Invalid"
				_res.Ktp = _loan.Ktp
				_res.Message = err.Error()
			}

			_intBirthdayYearInput, err := strconv.Atoi(_birthdateYear)
			if err != nil {
				_flag = false
				_res.Status = "Invalid"
				_res.Ktp = _loan.Ktp
				_res.Message = err.Error()
			}

			if (_intBirthdayYearKtp >= 1) && (_intBirthdayYearKtp <= 99) {
				if _intBirthdayYearKtp != _intBirthdayYearInput {
					_flag = false
					_res.Status = "Invalid"
					_res.Ktp = _loan.Ktp
					_res.Message = "Birthdate is not matching with ID"
				}
			} else {
				_flag = false
				_res.Status = "Invalid"
				_res.Ktp = _loan.Ktp
				_res.Message = "ID Number Is Not Acceptable"
			}
		}

		if _flag == true {
			stmtIns, err := db.Prepare("INSERT INTO tbl_loan (Date,KTP,BirthDate,Gender,Name,Ammount,Period) VALUES (?,?,?,?,?,?,?)")
			if err != nil {
				_res.Status = "Invalid"
				_res.Ktp = _loan.Ktp
				_res.Message = err.Error()
			}
			defer stmtIns.Close()

			_, err = stmtIns.Exec(_loan.Date, _loan.Ktp, _loan.Birthdate, _loan.Gender, _loan.Name,
				_loan.Ammount, _loan.Period)

			if err != nil {
				_res.Status = "Invalid"
				_res.Ktp = _loan.Ktp
				_res.Message = err.Error()
			} else {
				_res.Status = "Valid"
				_res.Ktp = _loan.Ktp
				_res.Message = "Data Accepted"
			}
		}
	} else {
		_res.Status = "Invalid"
		_res.Message = "json data not exists or incorect format"
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(_res)
}

func getAverageLoan(w http.ResponseWriter, r *http.Request) {
	var _res resAverage
	var _getparam loanEntities

	_db := connectmysql()
	defer _db.Close()

	json.NewDecoder(r.Body).Decode(&_getparam)

	if (loanEntities{}) != _getparam {
		rows, err := _db.Query("call sp_GetAvgLoan7day(?)", _getparam.Date)
		if err != nil {
			_res.Status = "Invalid"
			_res.Message = "date is incorect format"
		} else {
			var _avgdata averageEntities
			for rows.Next() {
				err2 := rows.Scan(&_avgdata.Count, &_avgdata.Summary, &_avgdata.Average)
				if err2 != nil {
					_res.Status = "Invalid"
					_res.Message = "No data found"
				} else {
					var _arrdata []averageEntities
					_arrdata = append(_arrdata, _avgdata)

					_res.Status = "IsValid"
					_res.Message = ""
					_res.Data = _arrdata
				}
			}
		}
	} else {
		_res.Status = "Invalid"
		_res.Message = "json data not exists or incorect format"
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(_res)
}

func getInstallment(w http.ResponseWriter, r *http.Request) {

	var _res resInstallment
	var _getdata loanEntities

	db := connectmysql()
	defer db.Close()

	json.NewDecoder(r.Body).Decode(&_getdata)

	if (loanEntities{}) != _getdata {
		_flag := true

		const _layoutiso = "2006-01-02"
		_inputdate, err := time.Parse(_layoutiso, _getdata.Date)
		if err != nil {
			_flag = false
			_res.Status = "Invalid"
			_res.Message = err.Error()
		}

		_period, err := strconv.Atoi(_getdata.Period)
		if err != nil {
			_flag = false
			_res.Status = "Invalid"
			_res.Message = err.Error()
		}

		var _rate float64
		if _flag != false {
			_rate = rateForInstallment(_period)
			if _rate <= 0 {
				_flag = false
				_res.Status = "Invalid"
				_res.Message = "Rate for input month not found"
			}
		}

		var _ammount float64
		if _flag != false {
			_ammount, err = strconv.ParseFloat(_getdata.Ammount, 64)
			if err != nil {
				_flag = false
				_res.Status = "Invalid"
				_res.Message = err.Error()
			}
		}

		var _arrInstallment []installmentEntities
		if _flag != false {
			_capital := _ammount / float64(_period)
			_interest := _ammount * (_rate / 100)

			var _installment installmentEntities
			var _duedate string
			var _grandtotal float64
			for i := 1; i <= _period; i++ {
				if i == 1 {
					_duedate = _inputdate.Format(_layoutiso)
				} else {
					_duedate = _inputdate.AddDate(0, 1, 0).Format(_layoutiso)
				}

				_installment.Month = i
				_installment.DueDate = _duedate
				_installment.Capital = math.Round(_capital)
				_installment.Interest = math.Round(_interest)
				_installment.Total = math.Round((_capital + _interest))
				_grandtotal = math.Round(_grandtotal + _installment.Total)

				_arrInstallment = append(_arrInstallment, _installment)
			}
			_res.Status = "IsValid"
			_res.Message = "Success"
			_res.Data = _arrInstallment
			_res.TotalCapital = math.Round(_capital)
			_res.TotalInterest = math.Round((_interest * float64(_period)))
			_res.GrandTotal = _grandtotal
		}
	} else {
		_res.Status = "Invalid"
		_res.Message = "json data not exists or incorect format"
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(_res)
}
