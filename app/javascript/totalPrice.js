
const start = document.getElementById('start_date');
const end = document.getElementById("end_date");

const computePrice = () => {
  const start = document.getElementById('start_date').value;
  const start_date = new Date(start);
  const end = document.getElementById("end_date").value;
  const end_date = new Date(end);
  const diffDays = parseInt((end_date - start_date) / (1000 * 60 * 60 * 24));
  console.log(diffDays);
  const price = parseInt(document.getElementById("prix_jour").innerText.split("crédits")[0]);
  const total_price = price * diffDays;
  if (isNaN(total_price)){
    console.log("") ;
  }
  else{
    const price_final = new Intl.NumberFormat().format(total_price)
    document.getElementById("total_price").innerHTML = '<p> Total: ' + price_final + ' crédits </p>';
  }
}

[start, end].forEach((input) => {
  input.addEventListener(("change"), computePrice);
})
