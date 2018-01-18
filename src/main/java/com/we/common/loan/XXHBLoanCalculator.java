package com.we.common.loan;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * Created on 2018/1/6 23:18
 *先息后本还款法
 * @author mh
 */
public class XXHBLoanCalculator extends LoanCalculatorAdapter {

    @Override
    public Loan calLoan(BigDecimal totalLoanMoney, int totalMonth, double loanRate, int rateType) {
        Loan loan = new Loan();
        double monthRate = loanRate / totalMonth / 100;
        BigDecimal monthInterest = totalLoanMoney.multiply(new BigDecimal(monthRate)).setScale(2, BigDecimal.ROUND_HALF_UP);
        List<LoanByMonth> allLoans = new ArrayList<>();
        for (int i = 1; i <= totalMonth; i++) {
            LoanByMonth loanByMonth = new LoanByMonth();
            loanByMonth.setMonth(i);
            loanByMonth.setInterest(monthInterest);
            loanByMonth.setRepayment(monthInterest);
            allLoans.add(loanByMonth);
        }
        LoanByMonth lastMonth = new LoanByMonth();
        lastMonth.setMonth(totalMonth);
        lastMonth.setInterest(monthInterest);
        lastMonth.setPayPrincipal(totalLoanMoney);
        lastMonth.setRepayment(totalLoanMoney.add(monthInterest));
        allLoans.set(totalMonth - 1, lastMonth);
        loan.setTotalLoanMoney(totalLoanMoney);
        loan.setTotalInterest(monthInterest.multiply(new BigDecimal(totalMonth)).setScale(2, BigDecimal.ROUND_HALF_UP));
        loan.setTotalRepayment(loan.getTotalInterest().add(totalLoanMoney));
        loan.setAllLoans(allLoans);
        return loan;
    }
}
