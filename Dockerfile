FROM theteamultroid/ultroid:main

# set timezone
ENV TZ=Asia/Tehran

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \

    # cloning the repo and installing requirements.
    && git clone https://github.com/LoopXS/Megan.git /root/LoopXS/ \
    && pip3 install --no-cache-dir -r root/LoopXS/requirements.txt \
    && pip3 install --no-cache-dir -r root/LoopXS/resources/startup/optional-requirements.txt \
    && pip3 uninstall av -y && pip3 install av --no-binary av

# changing workdir
WORKDIR /root/LoopXS/

# start the bot
CMD ["bash", "python3 - m Fenix"]
