document.addEventListener('turbo:load', () => {
  
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");
  
  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      if (!isNaN(inputValue)) {
        const salesCommission = Math.floor(inputValue * 0.1); 
        const salesProfit = inputValue - salesCommission;
        addTaxDom.innerHTML = `${salesCommission}`;
        profitDom.innerHTML = `${salesProfit}`;
      } 
    });
  }
});
