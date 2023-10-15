<template>
  <section>
    <div>
      <h1>New user</h1>
      <form @submit.prevent="post">
        <label for="name">Name: </label>
        <input id="name" v-model="name" type="text" name="name" />
        <button type="submit">submit</button>
      </form>
    </div>
  </section>
</template>

<script setup lang="ts">
const name = ref("");

const post = async () => {
  const { $repository } = useNuxtApp();
  const axios = $repository.getAxios();
  const users = await axios.post("/api/users", { name: name.value });
  const router = useRouter();
  router.push(`${users.id}`);
};
</script>
