var pagerBorrow = {
  formatState: function (value) {
      if (value === 0) {
          return '审核不通过';
      } else if (value === 1) {
          return '审核通过';
      } else if (value === 2) {
          return '审核中';
      } else if (value === 3) {
          return '未填写借款详情';
      }
  }
};