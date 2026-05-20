<script setup lang="ts">
import { computed } from 'vue'

const props = defineProps({
  type: {
    type: String,
    required: true,
    validator: (value: string) => ['do', 'dont'].includes(value)
  },
  title: {
    type: String,
    default: ''
  }
})

const isDo = computed(() => props.type === 'do')

const boxClass = computed(() => {
  return isDo.value 
    ? 'border-green-200 bg-green-50/80' 
    : 'border-red-200 bg-red-50/80'
})

const headerClass = computed(() => {
  return isDo.value 
    ? 'bg-green-500' 
    : 'bg-red-500'
})

const contentClass = computed(() => {
  return isDo.value ? 'do-content' : 'dont-content'
})

const displayTitle = computed(() => {
  if (props.title) return props.title
  return isDo.value ? 'Do' : 'Don\'t'
})
</script>

<template>
  <div class="rounded-lg overflow-hidden border shadow-sm recommendation-box transition-all duration-400" :class="boxClass">
    <v-click>
      <div class="text-white font-bold px-4 py-2 flex items-center gap-2 header-bar" :class="headerClass">
        <svg v-if="isDo" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
        <svg v-else xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
        {{ displayTitle }}
      </div>
    </v-click>
    <div class="p-4 text-[#374151]" :class="contentClass">
      <v-clicks>
        <slot />
      </v-clicks>
    </div>
  </div>
</template>

<style>
.recommendation-box:has(> :first-child.slidev-vclick-hidden) {
  opacity: 0;
  transform: translateY(10px);
}

.dont-content p, .do-content p {
  margin: 0 !important;
}

.dont-content ul, .do-content ul {
  margin: 0 !important;
  padding-left: 1.25rem !important;
}

.dont-content li, .do-content li {
  margin-bottom: 0.25rem;
  transition: max-height 0.4s ease-in-out, opacity 0.4s ease-in-out, margin 0.4s ease-in-out, transform 0.4s ease-in-out;
  max-height: 150px;
  opacity: 1;
  transform: translateX(0);
}

.dont-content li.slidev-vclick-hidden,
.do-content li.slidev-vclick-hidden {
  max-height: 0;
  opacity: 0;
  margin-bottom: 0;
  transform: translateX(-10px);
  pointer-events: none;
}

.dont-content li::marker {
  color: #ef4444;
}

.do-content li::marker {
  color: #22c55e;
}
</style>
