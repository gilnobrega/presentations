<script setup lang="ts">
import { computed } from 'vue'

const props = defineProps({
  clicks: {
    type: Number,
    default: 0
  }
})

// Angles and locations of Outer layer (green nodes) - R = 210, center = (300, 300)
// Angles: 180 (Sign Up), 252 (Settings), 324 (Home Tab), 36 (Profile), 108 (Login)
const outerNodes = [
  { name: 'Sign Up', x: 90, y: 300, w: 90, h: 32 },
  { name: 'Settings', x: 235.1, y: 100.3, w: 90, h: 32 },
  { name: 'Home Tab', x: 470.0, y: 176.6, w: 100, h: 32 },
  { name: 'Profile', x: 470.0, y: 423.4, w: 80, h: 32 },
  { name: 'Login', x: 235.1, y: 499.7, w: 80, h: 32 }
]

// Angles and locations of Middle layer (amber nodes) - R = 110, center = (300, 300)
// Angles: 180 (Design System), 252 (Auto Route), 324 (BLoC), 36 (Preferences), 108 (Dio)
const middleNodes = [
  { name: 'Design System', x: 190, y: 300, w: 120, h: 32 },
  { name: 'Auto Route', x: 266.0, y: 195.4, w: 100, h: 32 },
  { name: 'BLoC', x: 389.0, y: 235.3, w: 76, h: 32 },
  { name: 'Preferences', x: 389.0, y: 364.7, w: 110, h: 32 },
  { name: 'Dio', x: 266.0, y: 404.6, w: 64, h: 32 }
]

// Core layer (red node) - center = (300, 300)
const coreNode = { name: 'Flutter', x: 300, y: 300, w: 90, h: 34 }

// Concentric ring boundaries
const R1 = 60
const R2 = 160
const R3 = 260

// Path details for animation
// Sign Up (90, 300) -> Design System (190, 300) -> Flutter (300, 300)
const pathD = "M 90,300 C 130,260 150,340 190,300 C 230,260 260,320 300,300"
</script>

<template>
  <div class="dependency-onion-container">
    <svg viewBox="0 0 600 600" class="dependency-onion-svg">
      <defs>
        <!-- Drop Shadow Filter for nodes -->
        <filter id="node-shadow" x="-20%" y="-20%" width="140%" height="140%">
          <feDropShadow dx="0" dy="3" stdDeviation="4" flood-color="#000000" flood-opacity="0.06" />
          <feDropShadow dx="0" dy="1" stdDeviation="2" flood-color="#000000" flood-opacity="0.04" />
        </filter>

        <!-- Glow filter for paths -->
        <filter id="path-glow" x="-20%" y="-20%" width="140%" height="140%">
          <feGaussianBlur stdDeviation="3" result="blur" />
          <feMerge>
            <feMergeNode in="blur" />
            <feMergeNode in="SourceGraphic" />
          </feMerge>
        </filter>
        
        <!-- Glowing effect for active items -->
        <filter id="active-glow" x="-30%" y="-30%" width="160%" height="160%">
          <feGaussianBlur stdDeviation="5" result="blur" />
          <feComponentTransfer in="blur" result="boost">
            <feFuncA type="linear" slope="1.5"/>
          </feComponentTransfer>
          <feMerge>
            <feMergeNode in="boost" />
            <feMergeNode in="SourceGraphic" />
          </feMerge>
        </filter>

        <!-- Gradients for rings -->
        <radialGradient id="outer-ring-grad" cx="50%" cy="50%" r="50%">
          <stop offset="0%" stop-color="#10b981" stop-opacity="0" />
          <stop offset="100%" stop-color="#10b981" stop-opacity="0.03" />
        </radialGradient>
        <radialGradient id="middle-ring-grad" cx="50%" cy="50%" r="50%">
          <stop offset="0%" stop-color="#f59e0b" stop-opacity="0" />
          <stop offset="100%" stop-color="#f59e0b" stop-opacity="0.03" />
        </radialGradient>
        <radialGradient id="core-grad" cx="50%" cy="50%" r="50%">
          <stop offset="0%" stop-color="#ef4444" stop-opacity="0.08" />
          <stop offset="100%" stop-color="#ef4444" stop-opacity="0.01" />
        </radialGradient>

        <!-- Gradient for the animated path -->
        <linearGradient id="path-grad" x1="0%" y1="0%" x2="100%" y2="0%">
          <stop offset="0%" stop-color="#10b981" />
          <stop offset="50%" stop-color="#f59e0b" />
          <stop offset="100%" stop-color="#ef4444" />
        </linearGradient>
      </defs>

      <!-- LAYER 1: Concentric Rings Backgrounds (Outwards to Inwards) -->
      <!-- Outer Ring (Green) -->
      <g :class="['layer-bg', { 'layer-visible': clicks >= 1, 'layer-hidden': clicks < 1 }]">
        <circle cx="300" cy="300" :r="R3" fill="url(#outer-ring-grad)" stroke="#10b981" stroke-width="1.5" stroke-dasharray="6 6" stroke-opacity="0.4" />
      </g>
      
      <!-- Middle Ring (Amber) -->
      <g :class="['layer-bg', { 'layer-visible': clicks >= 2, 'layer-hidden': clicks < 2 }]">
        <circle cx="300" cy="300" :r="R2" fill="url(#middle-ring-grad)" stroke="#f59e0b" stroke-width="1.5" stroke-dasharray="5 5" stroke-opacity="0.4" />
      </g>
      
      <!-- Core Ring (Red) -->
      <g :class="['layer-bg', { 'layer-visible': clicks >= 3, 'layer-hidden': clicks < 3 }]">
        <circle cx="300" cy="300" :r="R1" fill="url(#core-grad)" stroke="#ef4444" stroke-width="2" stroke-dasharray="4 4" stroke-opacity="0.5" />
      </g>

      <!-- LAYER 2: Animated Debugging Path (clicks >= 4) -->
      <g :class="['onion-path-group', { 'layer-visible': clicks >= 4, 'layer-hidden': clicks < 4 }]">
        <!-- Glow backing path -->
        <path :d="pathD" fill="none" stroke="url(#path-grad)" stroke-width="7" stroke-linecap="round" opacity="0.35" filter="url(#path-glow)" />
        
        <!-- Main animated path -->
        <path 
          :d="pathD" 
          fill="none" 
          stroke="url(#path-grad)" 
          stroke-width="3" 
          stroke-linecap="round"
          class="onion-main-path"
          :class="{ 'animate-draw-path': clicks >= 4 }"
        />
        
        <!-- Glowing flowing particle packet -->
        <circle r="6" fill="#ef4444" filter="url(#active-glow)" class="glowing-particle">
          <animateMotion 
            v-if="clicks >= 4" 
            dur="2.5s" 
            repeatCount="indefinite" 
            :path="pathD" 
          />
        </circle>
      </g>

      <!-- LAYER 3: Outer Nodes badges (clicks >= 1) -->
      <g :class="['layer-nodes', { 'layer-visible': clicks >= 1, 'layer-hidden': clicks < 1 }]">
        <g v-for="node in outerNodes" :key="node.name" class="node-group" :class="{ 'node-active-path': clicks >= 4 && node.name === 'Sign Up' }">
          <rect 
            :x="node.x - node.w / 2" 
            :y="node.y - node.h / 2" 
            :width="node.w" 
            :height="node.h" 
            rx="16" 
            class="node-rect outer-node"
            filter="url(#node-shadow)"
          />
          <!-- Badge status dot -->
          <circle :cx="node.x - node.w / 2 + 14" :cy="node.y" r="4.5" fill="#10b981" />
          <text 
            :x="node.x + 6" 
            :y="node.y" 
            text-anchor="middle" 
            dominant-baseline="central" 
            class="node-text"
          >
            {{ node.name }}
          </text>
        </g>
      </g>

      <!-- LAYER 4: Middle Nodes badges (clicks >= 2) -->
      <g :class="['layer-nodes', { 'layer-visible': clicks >= 2, 'layer-hidden': clicks < 2 }]">
        <g v-for="node in middleNodes" :key="node.name" class="node-group" :class="{ 'node-active-path': clicks >= 4 && node.name === 'Design System' }">
          <rect 
            :x="node.x - node.w / 2" 
            :y="node.y - node.h / 2" 
            :width="node.w" 
            :height="node.h" 
            rx="16" 
            class="node-rect middle-node"
            filter="url(#node-shadow)"
          />
          <!-- Badge status dot -->
          <circle :cx="node.x - node.w / 2 + 14" :cy="node.y" r="4.5" fill="#f59e0b" />
          <text 
            :x="node.x + 6" 
            :y="node.y" 
            text-anchor="middle" 
            dominant-baseline="central" 
            class="node-text"
          >
            {{ node.name }}
          </text>
        </g>
      </g>

      <!-- LAYER 5: Core Node badge (clicks >= 3) -->
      <g :class="['layer-nodes', { 'layer-visible': clicks >= 3, 'layer-hidden': clicks < 3 }]">
        <g class="node-group" :class="{ 'node-active-path': clicks >= 4 }">
          <rect 
            :x="coreNode.x - coreNode.w / 2" 
            :y="coreNode.y - coreNode.h / 2" 
            :width="coreNode.w" 
            :height="coreNode.h" 
            rx="17" 
            class="node-rect core-node"
            filter="url(#node-shadow)"
          />
          <!-- Flutter Logo representation (Subtle Triangle / Diamond shape) -->
          <polygon 
            :points="`${coreNode.x - coreNode.w / 2 + 10},${coreNode.y} ${coreNode.x - coreNode.w / 2 + 15},${coreNode.y - 5} ${coreNode.x - coreNode.w / 2 + 20},${coreNode.y} ${coreNode.x - coreNode.w / 2 + 15},${coreNode.y + 5}`" 
            fill="#ef4444" 
          />
          <text 
            :x="coreNode.x + 8" 
            :y="coreNode.y" 
            text-anchor="middle" 
            dominant-baseline="central" 
            class="node-text core-text"
          >
            {{ coreNode.name }}
          </text>
        </g>
      </g>
    </svg>
  </div>
</template>

<style scoped>
.dependency-onion-container {
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
}

.dependency-onion-svg {
  width: 100%;
  height: auto;
  max-width: 500px;
  max-height: 500px;
}

/* Animations and Transitions for outward to inward click effect */
.layer-bg, .layer-nodes, .onion-path-group {
  transition: opacity 0.8s cubic-bezier(0.25, 1, 0.5, 1), 
              transform 0.8s cubic-bezier(0.34, 1.56, 0.64, 1);
  transform-origin: 300px 300px;
}

.layer-hidden {
  opacity: 0;
  pointer-events: none;
}

/* Specific scale direction: outwards are larger on entrance, inwards smaller */
g.layer-bg.layer-hidden {
  transform: scale(1.15);
}

g.layer-nodes.layer-hidden {
  transform: scale(1.15);
}

.layer-visible {
  opacity: 1;
  transform: scale(1) translate(0, 0);
  pointer-events: auto;
}

/* Node Rect Styles */
.node-rect {
  fill: #ffffff;
  stroke-width: 1.5;
  transition: all 0.5s ease;
}

.outer-node {
  stroke: #10b981;
  fill: rgba(255, 255, 255, 0.95);
}

.middle-node {
  stroke: #f59e0b;
  fill: rgba(255, 255, 255, 0.95);
}

.core-node {
  stroke: #ef4444;
  stroke-width: 2.5;
  fill: #fdf2f2;
}

/* Node Text Styles */
.node-text {
  font-family: 'Inter', system-ui, -apple-system, sans-serif;
  font-size: 11.5px;
  font-weight: 600;
  fill: #1f2937;
  letter-spacing: -0.01em;
  transition: fill 0.3s ease;
}

.core-text {
  font-size: 13px;
  font-weight: 800;
  fill: #b91c1c;
}

/* Highlight nodes on active path (click 4) */
.node-group {
  transition: transform 0.3s ease;
}

.node-group:hover {
  transform: translateY(-2px);
}

.node-active-path .node-rect.outer-node {
  stroke-width: 2.5;
  fill: #ecfdf5;
  filter: url(#active-glow);
}

.node-active-path .node-rect.middle-node {
  stroke-width: 2.5;
  fill: #fffbeb;
  filter: url(#active-glow);
}

.node-active-path .node-rect.core-node {
  stroke-width: 3.5;
  fill: #fef2f2;
  filter: url(#active-glow);
}

/* Path drawing animation */
.onion-main-path {
  stroke-dasharray: 500;
  stroke-dashoffset: 500;
  transition: stroke-dashoffset 2s cubic-bezier(0.4, 0, 0.2, 1);
}

.animate-draw-path {
  stroke-dashoffset: 0;
}

/* Glowing Flowing Particle */
.glowing-particle {
  animation: pulse-glow 1.5s infinite alternate;
}

@keyframes pulse-glow {
  0% {
    r: 5px;
    opacity: 0.8;
  }
  100% {
    r: 7.5px;
    opacity: 1;
  }
}
</style>
