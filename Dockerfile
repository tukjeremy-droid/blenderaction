FROM nvidia/cuda:12.4.1-devel-ubuntu22.04

# Системные runtime-зависимости Blender 5.1.x
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    xz-utils \
    \
    # X11 / XCB
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcb-render0 \
    libxcb-shm0 \
    libxcb-xfixes0 \
    libxcb-keysyms1 \
    libxcb-randr0 \
    libxcb-image0 \
    libxcb-shape0 \
    libxcb-sync1 \
    libxcb-xinerama0 \
    libxcb-util1 \
    libxau6 \
    libxdmcp6 \
    libxi6 \
    libxrender1 \
    libxfixes3 \
    libxxf86vm1 \
    libxcursor1 \
    libxrandr2 \
    libxinerama1 \
    \
    # XKB / X11 session
    libxkbcommon0 \
    libxkbcommon-x11-0 \
    libsm6 \
    libice6 \
    \
    # OpenGL / EGL / Mesa
    libgl1 \
    libglx0 \
    libegl1 \
    libvulkan1 \
    libegl-mesa0 \
    libglu1-mesa \
    libepoxy0 \
    libdrm2 \
    libgbm1 \
    \
    # Wayland
    libwayland-client0 \
    libwayland-egl1 \
    libwayland-cursor0 \
    \
    # GUI/runtime
    libdbus-1-3 \
    libglib2.0-0 \
    libfontconfig1 \
    libfreetype6 \
    libharfbuzz0b \
    \
    # Audio
    libasound2 \
    libpulse0 \
    libopenal1 \
    libsndfile1 \
    \
    # Image / image formats
    libpng16-16 \
    libjpeg-turbo8 \
    libtiff5 \
    \
    # Blender UI/runtime
    libdecor-0-0 \
    && rm -rf /var/lib/apt/lists/*

# Скачиваем Blender 5.1.1
RUN wget -q https://download.blender.org/release/Blender5.1/blender-5.1.1-linux-x64.tar.xz \
    && tar -xf blender-5.1.1-linux-x64.tar.xz -C /opt \
    && mv /opt/blender-5.1.1-linux-x64 /opt/blender \
    && rm blender-5.1.1-linux-x64.tar.xz

ENV PATH="/opt/blender:${PATH}"

WORKDIR /workspace

# Проверяем Blender ещё во время сборки образа
RUN blender --background --version

CMD ["/bin/bash"]
