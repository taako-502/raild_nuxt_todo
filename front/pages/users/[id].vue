<template>
  <h1>Hello, {{ name }}</h1>
  <div>
    <Button :onClick="remove">Remove</Button>
  </div>
  <NuxtLink to="/users/new">Back</NuxtLink>
  <NuxtLink to="/">Back to Top</NuxtLink>
</template>

<script setup type="ts">
const name = ref("")
const { $repository } = useNuxtApp();

const nameFromDB = async () => {
  const axios = $repository.getAxios();
  const route = useRoute();
  const id = route.path.split("/")[2];
  const response = await axios.get(`/api/users/${id}`)
  if (!response || !response.data || !response.data.name) return;
  name.value = response.data.name
}
nameFromDB()

const remove = async () => {
  if (!window.confirm('削除しますか？')) return

  const axios = $repository.getAxios();
  const route = useRoute();
  const id = route.path.split("/")[2];
  try {
    await axios.delete(`/api/users/${id}`)
    navigateTo("/")
  } catch (e) {
    alert(e)
  }
}
</script>
