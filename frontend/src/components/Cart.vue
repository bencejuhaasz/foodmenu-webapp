<template>
  <div class="cart">
    <h1>Cart</h1>
    <ul>
      <li v-for="(item, index) in cartItems" :key="item.id" class="cart-item">
        <h2>{{ item.name }}</h2>
        <p><strong>Price:</strong> ${{ item.price }}</p>
        <button @click="removeFromCart(index)">Remove</button>
      </li>
    </ul>
    <p><strong>Total:</strong> ${{ totalPrice }}</p>
    <button @click="submitOrder">Submit Order</button>
  </div>
</template>

<script>
export default {
  name: 'Cart',
  props: ['cartItems'],
  computed: {
    totalPrice() {
      return this.cartItems.reduce((total, item) => total + item.price, 0).toFixed(2);
    }
  },
  methods: {
    removeFromCart(index) {
      this.$emit('remove-from-cart', index);
    },
    submitOrder() {
      this.$emit('submit-order');
    }
  }
}
</script>

<style scoped>
.cart {
  padding: 20px;
}

.cart-item {
  border-bottom: 1px solid #ccc;
  padding: 10px 0;
}

.cart-item h2 {
  margin: 0;
  font-size: 1.5em;
}

.cart-item p {
  margin: 5px 0;
}

button {
  margin-top: 10px;
  padding: 5px 10px;
  background-color: #e74c3c;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

button:hover {
  background-color: #c0392b;
}
</style>
