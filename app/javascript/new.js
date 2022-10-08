function tax(){
  const price = document.getElementById("item-price");
  price.addEventListener("keyup", (e) => {
    const priceValue = document.getElementById("item-price").value
    const priceTax = parseInt(priceValue * 0.1);
    const priceIncome = parseInt(priceValue * 0.9);
    const tax = document.getElementById("add-tax-price");
    tax.innerHTML = priceTax;
    const income = document.getElementById("profit");
    income.innerHTML = priceIncome;
  });
};

window.addEventListener('load', tax);