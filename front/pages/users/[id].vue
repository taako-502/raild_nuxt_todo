<template>
  <h1>Hello, {{ name }}</h1>
</template>

<script setup type="ts">
const name = ref("")
const nameFromDB = async () => {
  const { $repository } = useNuxtApp();
  const axios = $repository.getAxios();
  const username  = await axios.$get(`/api/users/${params.id}`)
  return username.name
}
name = nameFromDB()
</script>
