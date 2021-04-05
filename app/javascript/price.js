function tax (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const itemPriceVal = itemPrice.value;
    const taxPrice = Math.floor(itemPriceVal / 10);
    const addTaxPrice  = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = taxPrice;
    const profit  = document.getElementById("profit");
    profit.innerHTML = itemPriceVal - taxPrice;
  });
}

window.addEventListener('load', tax);