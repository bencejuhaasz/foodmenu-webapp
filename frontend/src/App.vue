<template>
  <div id="app">
    <FoodMenu @add-to-cart="addToCart" v-if="!orderSubmitted && !showOrderForm" />
    <Cart 
      :cartItems="cart" 
      @remove-from-cart="removeFromCart" 
      @submit-order="showOrderForm = true" 
      v-if="!orderSubmitted && !showOrderForm"
    />
    <OrderForm 
      @order-submitted="handleOrderSubmission" 
      v-if="showOrderForm"
      :cart="cart"
    />
    <div v-if="orderSubmitted" class="confirmation">
      <h1>Order Confirmation</h1>
      <p>Thank you for your order, {{ orderDetails.name }}!</p>
      <p>Your order number is: <strong>{{ orderDetails.orderNumber }}</strong></p>
      <p>A confirmation email has been sent to {{ orderDetails.email }}</p>
    </div>
  </div>
</template>

<script>
import FoodMenu from './components/FoodMenu.vue';
import Cart from './components/Cart.vue';
import OrderForm from './components/OrderForm.vue';

export default {
  name: 'App',
  components: {
    FoodMenu,
    Cart,
    OrderForm
  },
  data() {
    return {
      cart: [],
      showOrderForm: false,
      orderSubmitted: false,
      orderDetails: {}
    }
  },
  methods: {
    addToCart(item) {
      this.cart.push(item);
    },
    removeFromCart(index) {
      this.cart.splice(index, 1);
    },
    handleOrderSubmission(details) {
      this.orderDetails = details;
      this.orderSubmitted = true;
      this.showOrderForm = false;
      this.cart = [];
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
  display: flex;
  justify-content: space-around;
}

.confirmation {
  text-align: center;
  margin-top: 20px;
}
</style>
