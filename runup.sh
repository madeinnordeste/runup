
#!/bin/sh

echo "RunUp..." 
echo ""

SOURCESDIR=./runup_source_files

case $1 in
	install)
		echo "Install"
        echo ""
        git submodule init
        git submodule update
        cd laradock/
        cp env-example .env
        docker-compose up -d workspace
        docker-compose exec --user=laradock workspace composer create-project laravel/laravel $SOURCESDIR --prefer-dist
        cd ..
        cp -Rf SOURCESDIR/* ./
        rm -Rf SOURCESDIR/
        chmod 777 -R bootstrap/cache/
        chmod 777 -R storage/
		;;
	laravel)
		echo "laravel"
		break
		;;
	*)
		echo "Sorry :( I don't understand"
		;;
esac