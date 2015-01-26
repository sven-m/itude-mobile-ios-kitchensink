//
//  SpecialPlantCatalogTableViewCell.m
//  kitchensink-app
//
//  Created by Emiel Bon on 20-01-15.
//  Copyright (c) 2015 Itude Mobile. All rights reserved.
//

#import "SpecialPlantCatalogTableViewCell.h"

@interface SpecialPlantCatalogTableViewCell ()

@property (retain, nonatomic) IBOutlet UILabel *commonNameLabel;
@property (retain, nonatomic) IBOutlet UILabel *botanicalNameLabel;
@property (retain, nonatomic) IBOutlet UILabel *coolPlantLabel;

@end

@implementation SpecialPlantCatalogTableViewCell

- (NSString *)commonName
{
    return self.commonNameLabel.text;
}

- (void)setCommonName:(NSString *)commonName
{
    self.commonNameLabel.text = commonName;
}

- (NSString *)botanicalName
{
    return self.botanicalNameLabel.text;
}

- (void)setBotanicalName:(NSString *)botanicalName
{
    self.botanicalNameLabel.text = botanicalName;
}

- (void)setCoolPlant:(BOOL)coolPlant
{
    _coolPlant = coolPlant;
    self.coolPlantLabel.text = (coolPlant) ? @"❄️+🌿=😃👍" : @"❄️+🌿=😢👎";
}

- (void)dealloc
{
    self.commonNameLabel = nil;
    self.botanicalNameLabel = nil;
    self.coolPlantLabel = nil;
    [super dealloc];
}

@end
