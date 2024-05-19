<template>
  <div class="food-menu">
    <h1>Food Menu</h1>
    <ul>
      <li v-for="item in menuItems" :key="item.id" class="menu-item">
        <h2>{{ item.name }}</h2>
        <p>{{ item.description }}</p>
        <p><strong>Price:</strong> ${{ item.price }}</p>
        <button @click="addToCart(item)">Add to Cart</button>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'FoodMenu',
  data() {
    return {
      menuItems: [
        { id: 1, name: 'Burger', description: 'A delicious beef burger', price: 8.99 },
        { id: 2, name: 'Pizza', description: 'Cheesy pepperoni pizza', price: 12.99 },
        { id: 3, name: 'Pasta', description: 'Creamy Alfredo pasta', price: 10.99 },
        { id: 4, name: 'Salad', description: 'Fresh garden salad', price: 7.99 }
      ]
    }
  },
  methods: {
    addToCart(item) {
      this.$emit('add-to-cart', item);
    }
  }
}
</script>

<style scoped>
.food-menu {
  padding: 20px;
}

.menu-item {
  border-bottom: 1px solid #ccc;
  padding: 10px 0;
}

.menu-item h2 {
  margin: 0;
  font-size: 1.5em;
}

.menu-item p {
  margin: 5px 0;
}

button {
  margin-top: 10px;
  padding: 5px 10px;
  background-color: #42b983;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

button:hover {
  background-color: #38a169;
}
</style>
