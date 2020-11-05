window.addEventListener('load', function() {
    const priceInput = document.getElementById("item-price");
    priceInput.addEventListener('input', function() {
       const inputValue = priceInput.value;
       console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue / 10);
       console.log(addTaxDom);
    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(inputValue - (inputValue / 10));
       console.log(profit);
})})