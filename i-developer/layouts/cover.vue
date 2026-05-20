<script setup lang="ts">
import { computed } from 'vue'

const props = defineProps({
  background: {
    type: String,
    default: '',
  },
  backgroundPosition: {
    type: String,
    default: 'center',
  },
  backgroundSize: {
    type: String,
    default: 'cover',
  },
  backgroundScale: {
    type: String,
    default: '',
  },
  separator: {
    type: Boolean,
    default: true,
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
      backgroundSize: props.backgroundScale || props.backgroundSize,
      backgroundPosition: props.backgroundPosition,
      backgroundRepeat: 'no-repeat',
    }
  }
  return {}
})
</script>

<template>
  <div class="slidev-layout cover relative w-full h-full px-12 py-10 flex flex-col justify-center items-center text-center" :style="backgroundStyle">
    <div class="absolute inset-0 bg-black/60 z-0 pointer-events-none"></div>

    <div class="my-auto w-full z-10 relative">
      <div class="inline-block text-center">
        <div class="slide-title">
          <slot />
        </div>
        <div v-if="separator" class="w-full h-2 bg-[#3b82f6] mt-8 rounded-full"></div>
      </div>
    </div>
  </div>
</template>
