# Compression
function compress
    tar -czf (string replace -r '/$' '' $argv[1]).tar.gz (string replace -r '/$' '' $argv[1])
end
alias decompress="tar -xzf"

# Write iso file to sd card
function iso2sd
    if test (count $argv) -ne 2
        echo "Usage: iso2sd <input_file> <output_device>"
        echo "Example: iso2sd ~/Downloads/ubuntu-25.04-desktop-amd64.iso /dev/sda"
        echo
        echo "Available SD cards:"
        lsblk -d -o NAME | grep -E '^sd[a-z]' | awk '{print "/dev/"$1}'
    else
        sudo dd bs=4M status=progress oflag=sync if=$argv[1] of=$argv[2]
        sudo eject $argv[2]
    end
end

# Format an entire drive for a single partition using ext4
function format-drive
    if test (count $argv) -ne 2
        echo "Usage: format-drive <device> <name>"
        echo "Example: format-drive /dev/sda 'My Stuff'"
        echo
        echo "Available drives:"
        lsblk -d -o NAME -n | awk '{print "/dev/"$1}'
    else
        echo "WARNING: This will completely erase all data on $argv[1] and label it '$argv[2]'."
        read -l -P "Are you sure you want to continue? (y/N): " confirm
        if string match -r -q '^[Yy]$' $confirm
            sudo wipefs -a $argv[1]
            sudo dd if=/dev/zero of=$argv[1] bs=1M count=100 status=progress
            sudo parted -s $argv[1] mklabel gpt
            sudo parted -s $argv[1] mkpart primary ext4 1MiB 100%
            set part (string match -r 'nvme' $argv[1]; and echo "$argv[1]p1"; or echo "$argv[1]1")
            sudo mkfs.ext4 -L $argv[2] $part
            sudo chmod -R 777 "/run/media/$USER/$argv[2]"
            echo "Drive $argv[1] formatted and labeled '$argv[2]'."
        end
    end
end

# Transcode a video to a good-balance 1080p that's great for sharing online
function transcode-video-1080p
    ffmpeg -i $argv[1] -vf scale=1920:1080 -c:v libx264 -preset fast -crf 23 -c:a copy (string replace -r '\.[^.]*$' '' $argv[1])-1080p.mp4
end

# Transcode a video to a good-balance 4K that's great for sharing online
function transcode-video-4K
    ffmpeg -i $argv[1] -c:v libx265 -preset slow -crf 24 -c:a aac -b:a 192k (string replace -r '\.[^.]*$' '' $argv[1])-optimized.mp4
end

# Transcode any image to JPG image that's great for shrinking wallpapers
function img2jpg
    magick $argv[1] -quality 95 -strip (string replace -r '\.[^.]*$' '' $argv[1]).jpg
end

# Transcode any image to JPG image that's great for sharing online without being too big
function img2jpg-small
    magick $argv[1] -resize 1080x\> -quality 95 -strip (string replace -r '\.[^.]*$' '' $argv[1]).jpg
end

# Transcode any image to compressed-but-lossless PNG
function img2png
    magick $argv[1] -strip -define png:compression-filter=5 \
        -define png:compression-level=9 \
        -define png:compression-strategy=1 \
        -define png:exclude-chunk=all \
        (string replace -r '\.[^.]*$' '' $argv[1]).png
end
