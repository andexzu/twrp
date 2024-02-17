#!/bin/bash
echo "alex161rus"
echo "============================================"
mkdir -p in
function partition_info {
	echo "============================================"
	echo "==============Partition info================"

	if [ -e unpack/system.img ]
		then
			system_size=$(stat -c%s unpack/system.img)
			if [[ $system_size > 1 ]]
				then
					system_string="--partition system:$readonly:$system_size:main --image system=./unpack/system.img"
				else
					system_size="4096"
					system_string="--partition system:$readonly:$system_size:main"
			fi
			metadata_slot="1"
			metadata_slot_name="A-only"
			echo "system="$system_size
		else
			system_size="0"
			system_string=""
	fi
	if [ -e unpack/system_a.img ]
		then
			system_a_size=$(stat -c%s unpack/system_a.img)
			if [[ $system_a_size > 1 ]]
				then
					system_a_string="--partition system_a:$readonly:$system_a_size:main --image system_a=./unpack/system_a.img"
				else
					system_a_size="4096"
					system_a_string="--partition system_a:$readonly:$system_a_size:main"
			fi
			metadata_slot="2"
			metadata_slot_name="A/B"
			echo "system_a="$system_a_size
		else
			system_a_size="0"
			system_a_string=""
	fi
	if [ -e unpack/system_b.img ]
		then
			system_b_size=$(stat -c%s unpack/system_b.img)
			if [[ $system_b_size > 1 ]]
				then
					system_b_string="--partition system_b:$readonly:$system_b_size:main --image system_b=./unpack/system_b.img"
				else
					system_b_size="4096"
					system_b_string="--partition system_b:$readonly:$system_b_size:main"
			fi
			echo "system_b="$system_b_size
		else
			system_b_size="0"
			system_b_string=""
	fi
	if [ -e unpack/vendor.img ]
		then
			vendor_size=$(stat -c%s unpack/vendor.img)
			if [[ $vendor_size > 1 ]]
				then
					vendor_string="--partition vendor:$readonly:$vendor_size:main --image vendor=./unpack/vendor.img"
				else
					vendor_size="4096"
					vendor_string="--partition vendor:$readonly:$vendor_size:main"
			fi
			echo "vendor="$vendor_size
		else
			vendor_size="0"
			vendor_string=""
	fi
	if [ -e unpack/vendor_a.img ]
		then
			vendor_a_size=$(stat -c%s unpack/vendor_a.img)
			if [[ $vendor_a_size > 1 ]]
				then
					vendor_a_string="--partition vendor_a:$readonly:$vendor_a_size:main --image vendor_a=./unpack/vendor_a.img"
				else
					vendor_a_size="4096"
					vendor_a_string="--partition vendor_a:$readonly:$vendor_a_size:main"
			fi
			echo "vendor_a="$vendor_a_size
		else
			vendor_a_size="0"
			vendor_a_string=""
	fi
	if [ -e unpack/vendor_b.img ]
		then
			vendor_b_size=$(stat -c%s unpack/vendor_b.img)
			if [[ $vendor_b_size > 1 ]]
				then
					vendor_b_string="--partition vendor_b:$readonly:$vendor_b_size:main --image vendor_b=./unpack/vendor_b.img"
				else
					vendor_b_size="4096"
					vendor_b_string="--partition vendor_b:$readonly:$vendor_b_size:main"
			fi
			echo "vendor_b="$vendor_b_size
		else
			vendor_b_size="0"
			vendor_b_string=""
	fi
	if [ -e unpack/product.img ]
		then
			product_size=$(stat -c%s unpack/product.img)
			if [[ $product_size > 1 ]]
				then
					product_string="--partition product:$readonly:$product_size:main --image product=./unpack/product.img"
				else
					product_size="4096"
					product_string="--partition product:$readonly:$product_size:main"
			fi
			echo "product="$product_size
		else
			product_size="0"
			product_string=""
	fi
	if [ -e unpack/product_a.img ]
		then
			product_a_size=$(stat -c%s unpack/product_a.img)
			if [[ $product_a_size > 1 ]]
				then
					product_a_string="--partition product_a:$readonly:$product_a_size:main --image product_a=./unpack/product_a.img"
				else
					product_a_size="4096"
					product_a_string="--partition product_a:$readonly:$product_a_size:main"
			fi
			echo "product_a="$product_a_size
		else
			product_a_size="0"
			product_a_string=""
	fi
	if [ -e unpack/product_b.img ]
		then
			product_b_size=$(stat -c%s unpack/product_b.img)
			if [[ $product_b_size > 1 ]]
				then
					product_b_string="--partition product_b:$readonly:$product_b_size:main --image product_b=./unpack/product_b.img"
				else
					product_b_size="4096"
					product_b_string="--partition product_b:$readonly:$product_b_size:main"
			fi
			echo "product_b="$product_b_size
		else
			product_b_size="0"
			product_b_string=""
	fi
	if [ -e unpack/odm.img ]
		then
			odm_size=$(stat -c%s unpack/odm.img)
			if [[ $odm_size > 1 ]]
				then
					odm_string="--partition odm:$readonly:$odm_size:main --image odm=./unpack/odm.img"
				else
					odm_size="4096"
					odm_string="--partition odm:$readonly:$odm_size:main"
			fi
			echo "odm="$odm_size
		else
			odm_size="0"
			odm_string=""
	fi
	if [ -e unpack/odm_a.img ]
		then
			odm_a_size=$(stat -c%s unpack/odm_a.img)
			if [[ $odm_a_size > 1 ]]
				then
					odm_a_string="--partition odm_a:$readonly:$odm_a_size:main --image odm_a=./unpack/odm_a.img"
				else
					odm_a_size="4096"
					odm_a_string="--partition odm_a:$readonly:$odm_a_size:main"
			fi
			echo "odm_a="$odm_a_size
		else
			odm_a_size="0"
			odm_a_string=""
	fi
	if [ -e unpack/odm_b.img ]
		then
			odm_b_size=$(stat -c%s unpack/odm_b.img)
			if [[ $odm_b_size > 1 ]]
				then
					odm_b_string="--partition odm_b:$readonly:$odm_b_size:main --image odm_b=./unpack/odm_b.img"
				else
					odm_b_size="4096"
					odm_b_string="--partition odm_b:$readonly:$odm_b_size:main"
			fi
			echo "odm_b="$odm_b_size
		else
			odm_b_size="0"
			odm_b_string=""
	fi
	if [ -e unpack/system_ext.img ]
		then
			system_ext_size=$(stat -c%s unpack/system_ext.img)
			if [[ $system_ext_size > 1 ]]
				then
					system_ext_string="--partition system_ext:$readonly:$system_ext_size:main --image system_ext=./unpack/system_ext.img"
				else
					system_ext_size="4096"
					system_ext_string="--partition system_ext:$readonly:$system_ext_size:main"
			fi
			echo "system_ext="$system_ext_size
		else
			system_ext_size="0"
			system_ext_string=""
	fi
	if [ -e unpack/system_ext_a.img ]
		then
			system_ext_a_size=$(stat -c%s unpack/system_ext_a.img)
			if [[ $system_ext_a_size > 1 ]]
				then
					system_ext_a_string="--partition system_ext_a:$readonly:$system_ext_a_size:main --image system_ext_a=./unpack/system_ext_a.img"
				else
					system_ext_a_size="4096"
					system_ext_a_string="--partition system_ext_a:$readonly:$system_ext_a_size:main"
			fi
			echo "system_ext_a="$system_ext_a_size
		else
			system_ext_a_size="0"
			system_ext_a_string=""
	fi
	if [ -e unpack/system_ext_b.img ]
		then
			system_ext_b_size=$(stat -c%s unpack/system_ext_b.img)
			if [[ $system_ext_b_size > 1 ]]
				then
					system_ext_b_string="--partition system_ext_b:$readonly:$system_ext_b_size:main --image system_ext_b=./unpack/system_ext_b.img"
				else
					system_ext_b_size="4096"
					system_ext_b_string="--partition system_ext_b:$readonly:$system_ext_b_size:main"
			fi
			echo "system_ext_b="$system_ext_b_size
		else
			system_ext_b_size="0"
			system_ext_b_string=""
	fi
	if [ -e unpack/super.img.iso ]
		then
			super_size=$(stat -c%s unpack/super.img.iso)
			super_string="--device super:$super_size"
			echo "super="$super_size
		else
			super_size=$(stat -c%s in/super.img)
			super_string="--device super:$super_size"
			echo "super="$super_size
	fi
	main_size=$(($system_size+$vendor_size+$odm_size+$product_size+$system_ext_size+$system_a_size+$vendor_a_size+$odm_a_size+$product_a_size+$system_ext_a_size+$system_b_size+$vendor_b_size+$odm_b_size+$product_b_size+$system_ext_b_size))
	echo "main="$main_size
	echo "============================================"
}
function unpack {
	rm -rf unpack
	mkdir -p unpack
	echo "============================================"
	echo "Образ super может быть как simg(sparse) так и img(raw,data)"
	echo "Поместите super.*** в папку in"
	echo "Можно использовать любое расширение"
	echo "============================================"
	echo "The super image can be either simg (sparse) or img (raw, data)"
	echo "Put super. *** in the in folder"
	echo "Any extension can be used"
	echo "============================================"
	read -n 1 -s -r -p "Для продолжения нажмите любую кнопку"
	echo
	echo "============================================"
	find_super=$(find in/ -name "super.*")
	type_img=$(file $find_super)
	if [[ $type_img =~ "sparse" ]]
		then
			echo "Преобразование simg(sparse) в img(raw,data)"
			echo "============================================"
			bin/./simg2img "$find_super" unpack/super.img.iso
			echo "Распаковка super.img"
			echo "============================================"
			bin/./lpunpack unpack/super.img.iso unpack
		elif [[ $type_img =~ "data" ]]
			then
				echo "Распаковка super.img"
				echo "============================================"
				bin/./lpunpack "$find_super" unpack
	fi
	partition_info
}
function build {
	partition_info
	echo "Режим файловой системы = "$name_readonly
	echo "Структура разделов = "$metadata_slot_name
	echo "============================================"
	rm -rf out
	mkdir -p out
	read -n 1 -s -r -p "Для продолжения нажмите любую кнопку"
	echo
	find_super=$(find in/ -name "super.*")
	name_super_out="${find_super#*/*}"
	run="--metadata-size 65536 --super-name super --metadata-slots $metadata_slot --device super:$super_size --group main:$main_size $system_string $system_a_string $system_b_string $vendor_string $vendor_a_string $vendor_b_string $product_string $product_a_string $product_b_string $odm_string $odm_a_string $odm_b_string $system_ext_string $system_ext_a_string $system_ext_b_string --sparse --output ./out/$name_super_out"
	#echo $run >> log.txt #смотрим как сформирована строка сборки, для отладки
	bin/./lpmake $run
}
function run_build {
options_build=("Собрать в режиме ro || Pack in RO mode" "Собрать режиме rw || Pack in RW mode" "Назад || Back")
select opt_build in "${options_build[@]}"
do
    case $opt_build in
        "Собрать в режиме ro || Pack in RO mode")
			readonly="readonly"
			name_readonly="RO"
			build
			myf
			;;
        "Собрать режиме rw || Pack in RW mode")
			readonly="none"
			name_readonly="RW"
			build
			myf
			;;
        "Назад || Back")
            break
            ;;
        *) echo "Неверный ввод $REPLY";;
    esac
done
}
function unlock {
	if [ -e unpack/system.img ]
		then
			system_size=$(stat -c%s unpack/system.img)
			if [[ $system_size > 1 ]]
				then
					sudo resize2fs -f ./unpack/system.img 1G
					sudo e2fsck -y -E unshare_blocks ./unpack/system.img
					sudo resize2fs -f -M ./unpack/system.img
			fi
	fi
	if [ -e unpack/system_a.img ]
		then
			system_a_size=$(stat -c%s unpack/system_a.img)
			if [[ $system_a_size > 1 ]]
				then
					sudo resize2fs -f ./unpack/system_a.img 1G
					sudo e2fsck -y -E unshare_blocks ./unpack/system_a.img
					sudo resize2fs -f -M ./unpack/system_a.img
			fi
	fi
	if [ -e unpack/system_b.img ]
		then
			system_b_size=$(stat -c%s unpack/system_b.img)
			if [[ $system_b_size > 1 ]]
				then
					sudo resize2fs -f ./unpack/system_b.img 1G
					sudo e2fsck -y -E unshare_blocks ./unpack/system_b.img
					sudo resize2fs -f -M ./unpack/system_b.img
			fi
	fi
	if [ -e unpack/vendor.img ]
		then
			vendor_size=$(stat -c%s unpack/vendor.img)
			if [[ $vendor_size > 1 ]]
				then
					sudo resize2fs -f ./unpack/vendor.img 1G
					sudo e2fsck -y -E unshare_blocks ./unpack/vendor.img
					sudo resize2fs -f -M ./unpack/vendor.img
			fi
	fi
	if [ -e unpack/vendor_a.img ]
		then
			vendor_a_size=$(stat -c%s unpack/vendor_a.img)
			if [[ $vendor_a_size > 1 ]]
				then
					sudo resize2fs -f ./unpack/vendor_a.img 1G
					sudo e2fsck -y -E unshare_blocks ./unpack/vendor_a.img
					sudo resize2fs -f -M ./unpack/vendor_a.img
			fi
	fi
	if [ -e unpack/vendor_b.img ]
		then
			vendor_b_size=$(stat -c%s unpack/vendor_b.img)
			if [[ $vendor_b_size > 1 ]]
				then
					sudo resize2fs -f ./unpack/vendor_b.img 1G
					sudo e2fsck -y -E unshare_blocks ./unpack/vendor_b.img
					sudo resize2fs -f -M ./unpack/vendor_b.img
			fi
	fi
	if [ -e unpack/product.img ]
		then
			product_size=$(stat -c%s unpack/product.img)
			if [[ $product_size > 1 ]]
				then
					sudo resize2fs -f ./unpack/product.img 1G
					sudo e2fsck -y -E unshare_blocks ./unpack/product.img
					sudo resize2fs -f -M ./unpack/product.img
			fi
	fi
	if [ -e unpack/product_a.img ]
		then
			product_a_size=$(stat -c%s unpack/product_a.img)
			if [[ $product_a_size > 1 ]]
				then
					sudo resize2fs -f ./unpack/product_a.img 1G
					sudo e2fsck -y -E unshare_blocks ./unpack/product_a.img
					sudo resize2fs -f -M ./unpack/product_a.img
			fi
	fi
	if [ -e unpack/product_b.img ]
		then
			product_b_size=$(stat -c%s unpack/product_b.img)
			if [[ $product_b_size > 1 ]]
				then
					sudo resize2fs -f ./unpack/product_b.img 1G
					sudo e2fsck -y -E unshare_blocks ./unpack/product_b.img
					sudo resize2fs -f -M ./unpack/product_b.img
			fi
	fi
	if [ -e unpack/odm.img ]
		then
			odm_size=$(stat -c%s unpack/odm.img)
			if [[ $odm_size > 1 ]]
				then
					sudo resize2fs -f ./unpack/odm.img 1G
					sudo e2fsck -y -E unshare_blocks ./unpack/odm.img
					sudo resize2fs -f -M ./unpack/odm.img
			fi
	fi
	if [ -e unpack/odm_a.img ]
		then
			odm_a_size=$(stat -c%s unpack/odm_a.img)
			if [[ $odm_a_size > 1 ]]
				then
					sudo resize2fs -f ./unpack/odm_a.img 1G
					sudo e2fsck -y -E unshare_blocks ./unpack/odm_a.img
					sudo resize2fs -f -M ./unpack/odm_a.img
			fi
	fi
	if [ -e unpack/odm_b.img ]
		then
			odm_b_size=$(stat -c%s unpack/odm_b.img)
			if [[ $odm_b_size > 1 ]]
				then
					sudo resize2fs -f ./unpack/odm_b.img 1G
					sudo e2fsck -y -E unshare_blocks ./unpack/odm_b.img
					sudo resize2fs -f -M ./unpack/odm_b.img
			fi
	fi
	if [ -e unpack/system_ext.img ]
		then
			system_ext_size=$(stat -c%s unpack/system_ext.img)
			if [[ $system_ext_size > 1 ]]
				then
					sudo resize2fs -f ./unpack/system_ext.img 1G
					sudo e2fsck -y -E unshare_blocks ./unpack/system_ext.img
					sudo resize2fs -f -M ./unpack/system_ext.img
			fi
	fi
	if [ -e unpack/system_ext_a.img ]
		then
			system_ext_a_size=$(stat -c%s unpack/system_ext_a.img)
			if [[ $system_ext_a_size > 1 ]]
				then
					sudo resize2fs -f ./unpack/system_ext_a.img 1G
					sudo e2fsck -y -E unshare_blocks ./unpack/system_ext_a.img
					sudo resize2fs -f -M ./unpack/system_ext_a.img
			fi
	fi
	if [ -e unpack/system_ext_b.img ]
		then
			system_ext_b_size=$(stat -c%s unpack/system_ext_b.img)
			if [[ $system_ext_b_size > 1 ]]
				then
					sudo resize2fs -f ./unpack/system_ext_b.img 1G
					sudo e2fsck -y -E unshare_blocks ./unpack/system_ext_b.img
					sudo resize2fs -f -M ./unpack/system_ext_b.img
			fi
	fi
}
function myf {
PS3='Для продолжения выберите:'
options=(
"Распаковать || Unpack"
"Собрать super || Pack super"
"Разблокировать разделы || Unlock Sections"
"Выход || Exit")
select opt in "${options[@]}"
do
    case $opt in
        "Распаковать || Unpack")
			clear -x
			unpack
			#myf
            ;;
        "Собрать super || Pack super")
			clear -x
			run_build
			read -n 1 -s -r -p "Для продолжения нажмите любую кнопку"
			myf
			;;
        "Разблокировать разделы || Unlock Sections")
			clear -x
			unlock
			read -n 1 -s -r -p "Для продолжения нажмите любую кнопку"
			myf
			;;
        "Выход || Exit")
			exit
            ;;
        *) echo "Неверный ввод $REPLY";;
    esac
done
}
myf
