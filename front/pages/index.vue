<template>
  <section>
    <NuxtLink to="/users/new">Go to New User Page</NuxtLink>
    <ul>
      <li v-for="user in users" :key="user.id">
        <NuxtLink :to="`/users/${user.id}`">{{ user.name }}</NuxtLink>
      </li>
    </ul>
  </section>
</template>

<script setup lang="ts">
interface IUser {
  id?: number
  name?: string
}
const users = ref<IUser[]>([])

const { $repository } = useNuxtApp()
const axios = $repository.getAxios()
const response = await axios.get('/api/users')
console.log(response.data)
users.value = response.data
</script>
