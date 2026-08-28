FROM nvidia/cuda:12.4.1-devel-ubuntu22.04

# Нужные системные библиотеки для запуска Blender headless + рендера
RUN apt-get update && apt-get install -y \
    wget xz-utils \
    libx11-6 libxi6 libxrender1 libxfixes3 libxxf86vm1 \
    libgl1 libglu1-mesa \
    && rm -rf /var/lib/apt/lists/*

# Скачиваем и распаковываем Blender 5.1.1
RUN wget -q https://download.blender.org/release/Blender5.1/blender-5.1.1-linux-x64.tar.xz \
    && tar -xf blender-5.1.1-linux-x64.tar.xz -C /opt \
    && mv /opt/blender-5.1.1-linux-x64 /opt/blender \
    && rm blender-5.1.1-linux-x64.tar.xz

ENV PATH="/opt/blender:${PATH}"

WORKDIR /workspace

CMD ["/bin/bash"]
