<script setup lang="ts">
import { useApi } from "@directus/extensions-sdk";
import { ref, watch } from "vue";
import { GoogleMap, Marker } from "vue3-google-map";

const props = defineProps<{
  value: { lat: number; lng: number };
}>();

const emit = defineEmits(["input"]);

const API_KEY = ref<string | null>(null);

const fetchData = async () => {
  const api = useApi();
  const { data } = await api.get("/google-maps-endpoint/google-maps-api-key");
  API_KEY.value = data;
  console.log(API_KEY.value);
};
fetchData();

let center = props.value;
const isCenterLoaded = ref(false);

async function defineCenter() {
  return new Promise((resolve) => {
    setTimeout(() => {
      isCenterLoaded.value = true;
      resolve(center);
    }, 1000);
  });
}
defineCenter();

const handleClick = (event) => {
  const newCenter: { lat: number; lng: number } = {
    lat: event.latLng.lat(),
    lng: event.latLng.lng(),
  };
  center = newCenter;
};

const handleLocationChange = (event) => {
  emit("input", center);
};

watch(
  () => props.value,
  (newValue) => {
    center = newValue;
  }
);
</script>

<template>
  <div v-if="isCenterLoaded && API_KEY">
    <GoogleMap
      :api-key="API_KEY"
      style="width: 100%; height: 500px"
      :center="center"
      :zoom="center ? 15 : 1"
      @click="handleClick($event), handleLocationChange($event)"
    >
      <Marker v-if="center" :options="{ position: center }" />
    </GoogleMap>
  </div>
</template>