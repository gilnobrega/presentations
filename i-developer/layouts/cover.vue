<script setup lang="ts">
import { computed } from 'vue'

const props = defineProps({
  background: {
    type: String,
    default: '',
  },
})

const backgroundStyle = computed(() => {
  if (props.background) {
    const isColor = props.background.startsWith('#') || props.background.startsWith('rgb')
    if (isColor) {
      return { backgroundColor: props.background }
    }
    return {
      backgroundImage: `url(${props.background})`,
      backgroundSize: 'cover',
      backgroundPosition: 'center',
      backgroundRepeat: 'no-repeat',
    }
  }
  return {}
})
</script>

<template>
  <div class="slidev-layout cover relative w-full h-full px-12 py-10 flex flex-col justify-center items-center text-center" :style="backgroundStyle">
    <!-- Dark transparency overlay to ensure text is ALWAYS readable -->
    <div class="absolute inset-0 bg-black/60 z-0 pointer-events-none"></div>

    <div class="my-auto w-full z-10 relative">
      <div class="inline-block text-center">
        <div class="slide-title">
          <slot />
        </div>
        <div class="w-full h-2 bg-[#3b82f6] mt-8 rounded-full"></div>
      </div>
    </div>
  </div>
</template>

<style>
.slidev-layout.cover {
  color: #f3f4f6;
  text-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);
}

.slidev-layout.cover h1 {
  margin: 0 !important;
  font-size: 4.5rem;
  font-weight: 800;
  color: #ffffff;
  letter-spacing: -0.025em;
  line-height: 1.1;
  text-shadow: 0 4px 15px rgba(0, 0, 0, 0.6);
}

.slidev-layout.cover h2,
.slidev-layout.cover h3,
.slidev-layout.cover h4,
.slidev-layout.cover h5,
.slidev-layout.cover h6 {
  color: #ffffff;
  font-weight: 800;
  letter-spacing: -0.025em;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
}

.slidev-layout.cover p {
  margin-top: 1.5rem;
  font-size: 1.75rem;
  color: #ffffff;
  font-weight: 600;
  text-shadow: 0 4px 15px rgba(0, 0, 0, 0.8), 0 0 20px rgba(0, 0, 0, 0.5);
}

.slidev-layout.cover strong,
.slidev-layout.cover b,
.slidev-layout.cover a {
  color: #60a5fa; /* A slightly brighter blue for dark backgrounds */
}
</style>
