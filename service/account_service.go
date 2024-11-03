package service

import (
	"GoHexagonal/errs"
	"GoHexagonal/logs"
	"GoHexagonal/repository"
	"strings"
	"time"
)

type accountService struct {
	accountRepository repository.AccountRepository
}

func NewAccountService(accountRepository repository.AccountRepository) AccountService {
	return accountService{accountRepository: accountRepository}
}

func (s accountService) NewAccount(customerID int, request NewAccountRequest) (*AccountResponse, error) {
	//Validate
	if request.Amount < 5000 {
		return nil , errs.NewValidationError("amount at least 5,000")
	}
	if strings.ToLower(request.AccountType) != "saving" && strings.ToLower(request.AccountType)  != "checking" {
		return nil, errs.NewValidationError("account type must be saving or checking")
	}

	account := repository.Account{
		CustomerID:  customerID,
		OpeningDate: time.Now().Format("2006-1-2 15:04:05"),
		AccountType: request.AccountType,
		Amount:      request.Amount,
		Status:      1,
	}

	newAcc, err := s.accountRepository.Create(account)
	if err != nil {
		logs.Error(err)
		return nil, errs.NewUnexspected()
	}

	response := AccountResponse{
		AccountID:   newAcc.AccountID,
		OpeningDate: newAcc.OpeningDate,
		AccountType: newAcc.AccountType,
		Amount:      newAcc.Amount,
		Status:      newAcc.Status,
	}
	return &response , nil
}

func (s accountService) GetAccounts(customerID int) ([]AccountResponse, error) {
	accounts, err := s.accountRepository.GetAll(customerID)
	if err != nil {
		logs.Error(err)
		return nil, errs.NewUnexspected()
	}

	responses := []AccountResponse{}
	for _, account := range accounts {
		responses = append(responses, AccountResponse{
			AccountID:   account.AccountID,
			OpeningDate: account.OpeningDate,
			AccountType: account.AccountType,
			Amount:      account.Amount,
			Status:      account.Status,
		})
	}
	return responses, nil
}
