<template>
  <h1>Hello, {{ name }}</h1>
  <NuxtLink to="/users/new">Back</NuxtLink>
</template>

<script setup type="ts">
const name = ref("")
const nameFromDB = async () => {
  const { $repository } = useNuxtApp();
  const axios = $repository.getAxios();
  const route = useRoute();
  const id = route.path.split("/")[2];
  const response = await axios.get(`/api/users/${id}`)
  if (!response || !response.data || !response.data.name) return;
  name.value = response.data.name
}
nameFromDB()
</script>
