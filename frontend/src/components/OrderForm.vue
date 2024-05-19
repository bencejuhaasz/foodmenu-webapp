<template>
  <div class="order-form-container">
    <h2>Order Details</h2>
    <form @submit.prevent="submitOrder" class="order-form">
      <div class="form-group">
        <label for="name">Name:</label>
        <input type="text" id="name" v-model="name" required />
      </div>
      <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" v-model="email" required />
      </div>
      <div class="form-group">
        <label for="address">Address:</label>
        <input type="text" id="address" v-model="address" required />
      </div>
      <button type="submit" class="submit-button">Submit Order</button>
    </form>
     <div v-if="orderSubmitted">
      <p>Order submitted successfully! Order ID: {{ orderId }}</p>
     </div>  
  </div>
</template>

<script>
export default {
  data() {
    return {
      name: '',
      email: '',
      address: '',
      orderResponse: '',
      orderSubmitted: false,
      orderId: ''
    };
  },
  props: ['cart'],
  methods: {
    async submitOrder() {
      console.log('submitOrder function called');
      // Ensure this.cart is defined before accessing its properties
      if (this.cart) {
        const order = {
          name: this.name,
          email: this.email,
          address: this.address,
          orderDetails: this.cart.map(item => item.name).join(', ')
        };

        console.log('Order details:', order);

        try {
          const response = await fetch('http://localhost:8080/api/orders', {
            method: 'POST',
            headers: {
              'Content-Type': 'application/json'
            },
            body: JSON.stringify(order)
          });

          const result = await response.json();
          this.orderResponse = `Order submitted successfully! Your order number is ${result.orderNumber}`;
          console.log('Order response:', result);
          this.orderId = result.orderNumber;
          this.orderSubmitted = true;
        } catch (error) {
          this.orderResponse = 'Failed to submit order.';
          console.error('Error submitting order:', error);
        }
      } else {
        console.error('Cart is undefined');
      }
    }
  }
};
</script>

<style scoped>
.order-form-container {
  max-width: 400px;
  margin: 0 auto;
}

.order-form {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.form-group {
  margin-bottom: 20px;
}

label {
  font-weight: bold;
}

input[type="text"],
input[type="email"] {
  width: 100%;
  padding: 8px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

.submit-button {
  padding: 10px 20px;
  font-size: 16px;
  background-color: #4CAF50;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.submit-button:hover {
  background-color: #45a049;
}

.order-response {
  margin-top: 20px;
  font-weight: bold;
}
</style>
