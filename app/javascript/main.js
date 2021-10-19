'use strict';

// {
//   document.querySelector('button').addEventListener('click',() => {
//     const li = document.createElement('li');
//     const color = document.querySelector('select');
//     li.textContent = `${color.value} - ${color.selectedIndex}`;
//     document.querySelector('ul').appendChild(li);
//   });
// }


  window.addEventListener('load', function(){


  document.querySelector('button').addEventListener('click', () => {
    console.log("teso")
    const li = document.createElement('li');
    const text = document.querySelector('input');
    li.textContent = text.value;
    document.querySelector('ul').appendChild(li);

    text.value = '';
    text.focus();
  });

    
    //セレクトボックスが切り替わったら発動
    // const deco = document.getElementById('post_decoration_id');
    //   deco.addEventListener("text_area", () => {
    //     const decodeco = document.getElementById("post_text");
    // {
    //   document.getElementById('button').addEventListener('click',() => {
    //     const li = document.getElementById('post_decoration_id');
    //     const word = document.querySelector('select');
    //     li.textContent = `お題：${word.value} `;
    //     document.querySelector('post_text');
    //   });
    // // }


  
    
      // document.getElementById('post_decoration_id').addEventListener('onchange',() =>{
      //   // document.getElementById('post_text').textContent = `お題：${decoration_id.name}`
      //   debugger
      //   const item2 = document.createElement('post_text');
      //       item2.textContent = 'item 2';
      // })
    

    //     const fee = item_price.value * 0.1;
    // const addTaxPrice = document.getElementById("add-tax-price");
    // addTaxPrice.innerHTML = `${fee}`;
    
    // .change(function() {
    //   deco

      //   console.log("イベント発火")
      // //選択したvalue値を変数に格納
      // var val = $(this).val();

      // //選択したvalue値をp要素に出力
      // ('post_text').text(val);
   
});