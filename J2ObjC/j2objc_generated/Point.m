//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: Java/src/main/java/harrycheung/map/Point.java
//

#include "J2ObjC_source.h"
#include "Point.h"
#include "java/lang/Math.h"

__attribute__((unused)) static jdouble HCMPoint_roundValueWithDouble_(HCMPoint *self, jdouble value);

@interface HCMPoint () {
}

- (jdouble)roundValueWithDouble:(jdouble)value;
@end

@implementation HCMPoint

- (instancetype)initHCMPointWithDouble:(jdouble)latitude
                            withDouble:(jdouble)longitude
                           withBoolean:(jboolean)inRadians {
  if (self = [super init]) {
    if (inRadians) {
      self->latitude_ = latitude;
      self->longitude_ = longitude;
    }
    else {
      self->latitude_ = JavaLangMath_toRadiansWithDouble_(latitude);
      self->longitude_ = JavaLangMath_toRadiansWithDouble_(longitude);
    }
    self->generated_ = NO;
  }
  return self;
}

- (instancetype)initWithDouble:(jdouble)latitude
                    withDouble:(jdouble)longitude
                   withBoolean:(jboolean)inRadians {
  return [self initHCMPointWithDouble:latitude withDouble:longitude withBoolean:inRadians];
}

- (instancetype)initWithDouble:(jdouble)latitude
                    withDouble:(jdouble)longitude {
  return [self initHCMPointWithDouble:latitude withDouble:longitude withBoolean:NO];
}

- (instancetype)initWithDouble:(jdouble)latitude
                    withDouble:(jdouble)longitude
                    withDouble:(jdouble)bearing {
  if (self = [self initHCMPointWithDouble:latitude withDouble:longitude withBoolean:NO]) {
    self->bearing_ = bearing;
  }
  return self;
}

- (instancetype)initWithDouble:(jdouble)latitude
                    withDouble:(jdouble)longitude
                    withDouble:(jdouble)speed
                    withDouble:(jdouble)bearing
                    withDouble:(jdouble)horizontalAccuracy
                    withDouble:(jdouble)verticalAccuracy
                    withDouble:(jdouble)timestamp {
  if (self = [self initHCMPointWithDouble:latitude withDouble:longitude withBoolean:NO]) {
    self->speed_ = speed;
    self->bearing_ = bearing;
    self->hAccuracy_ = horizontalAccuracy;
    self->vAccuracy_ = verticalAccuracy;
    self->timestamp_ = timestamp;
  }
  return self;
}

- (jboolean)isEqual:(id)point {
  return [self getLatitudeDegrees] == [((HCMPoint *) nil_chk(((HCMPoint *) check_class_cast(point, [HCMPoint class])))) getLatitudeDegrees] && [self getLongitudeDegrees] == [((HCMPoint *) nil_chk(((HCMPoint *) check_class_cast(point, [HCMPoint class])))) getLongitudeDegrees];
}

- (NSString *)description {
  return JreStrcat("$DCD", @"Point: ", [self getLatitudeDegrees], ',', [self getLongitudeDegrees]);
}

- (void)setLapTimeWithDouble:(jdouble)startTime
                  withDouble:(jdouble)splitStartTime {
  lapTime_ = timestamp_ - startTime;
  splitTime_ = timestamp_ - splitStartTime;
}

- (jdouble)roundValueWithDouble:(jdouble)value {
  return HCMPoint_roundValueWithDouble_(self, value);
}

- (jdouble)getLatitudeDegrees {
  return HCMPoint_roundValueWithDouble_(self, JavaLangMath_toDegreesWithDouble_(self->latitude_));
}

- (jdouble)getLongitudeDegrees {
  return HCMPoint_roundValueWithDouble_(self, JavaLangMath_toDegreesWithDouble_(self->longitude_));
}

- (HCMPoint *)subtractWithHCMPoint:(HCMPoint *)Point {
  return [[[HCMPoint alloc] initWithDouble:self->latitude_ - ((HCMPoint *) nil_chk(Point))->latitude_ withDouble:self->longitude_ - Point->longitude_ withBoolean:YES] autorelease];
}

- (jdouble)bearingToWithHCMPoint:(HCMPoint *)Point
                     withBoolean:(jboolean)inRadians {
  jdouble φ1 = latitude_;
  jdouble φ2 = ((HCMPoint *) nil_chk(Point))->latitude_;
  jdouble Δλ = Point->longitude_ - self->longitude_;
  jdouble y = JavaLangMath_sinWithDouble_(Δλ) * JavaLangMath_cosWithDouble_(φ2);
  jdouble x = JavaLangMath_cosWithDouble_(φ1) * JavaLangMath_sinWithDouble_(φ2) - JavaLangMath_sinWithDouble_(φ1) * JavaLangMath_cosWithDouble_(φ2) * JavaLangMath_cosWithDouble_(Δλ);
  jdouble θ = JavaLangMath_atan2WithDouble_withDouble_(y, x);
  if (inRadians) {
    return HCMPoint_roundValueWithDouble_(self, fmod((θ + 2 * JavaLangMath_PI), JavaLangMath_PI));
  }
  else {
    return HCMPoint_roundValueWithDouble_(self, fmod((JavaLangMath_toDegreesWithDouble_(θ) + 2 * 360), 360));
  }
}

- (jdouble)bearingToWithHCMPoint:(HCMPoint *)Point {
  return [self bearingToWithHCMPoint:Point withBoolean:NO];
}

- (HCMPoint *)destinationWithDouble:(jdouble)bearing
                         withDouble:(jdouble)distance {
  jdouble θ = JavaLangMath_toRadiansWithDouble_(bearing);
  jdouble δ = distance / HCMPoint_RADIUS;
  jdouble φ1 = latitude_;
  jdouble λ1 = longitude_;
  jdouble φ2 = JavaLangMath_asinWithDouble_(JavaLangMath_sinWithDouble_(φ1) * JavaLangMath_cosWithDouble_(δ) + JavaLangMath_cosWithDouble_(φ1) * JavaLangMath_sinWithDouble_(δ) * JavaLangMath_cosWithDouble_(θ));
  jdouble λ2 = λ1 + JavaLangMath_atan2WithDouble_withDouble_(JavaLangMath_sinWithDouble_(θ) * JavaLangMath_sinWithDouble_(δ) * JavaLangMath_cosWithDouble_(φ1), JavaLangMath_cosWithDouble_(δ) - JavaLangMath_sinWithDouble_(φ1) * JavaLangMath_sinWithDouble_(φ2));
  λ2 = fmod((λ2 + 3.0 * JavaLangMath_PI), (2.0 * JavaLangMath_PI)) - JavaLangMath_PI;
  return [[[HCMPoint alloc] initWithDouble:φ2 withDouble:λ2 withBoolean:YES] autorelease];
}

- (jdouble)distanceToWithHCMPoint:(HCMPoint *)point {
  jdouble φ1 = latitude_;
  jdouble λ1 = longitude_;
  jdouble φ2 = ((HCMPoint *) nil_chk(point))->latitude_;
  jdouble λ2 = point->longitude_;
  jdouble Δφ = φ2 - φ1;
  jdouble Δλ = λ2 - λ1;
  jdouble a = JavaLangMath_sinWithDouble_(Δφ / 2) * JavaLangMath_sinWithDouble_(Δφ / 2) + JavaLangMath_cosWithDouble_(φ1) * JavaLangMath_cosWithDouble_(φ2) * JavaLangMath_sinWithDouble_(Δλ / 2) * JavaLangMath_sinWithDouble_(Δλ / 2);
  return HCMPoint_RADIUS * 2 * JavaLangMath_atan2WithDouble_withDouble_(JavaLangMath_sqrtWithDouble_(a), JavaLangMath_sqrtWithDouble_(1 - a));
}

+ (HCMPoint *)intersectSimpleWithHCMPoint:(HCMPoint *)p
                             withHCMPoint:(HCMPoint *)p2
                             withHCMPoint:(HCMPoint *)q
                             withHCMPoint:(HCMPoint *)q2 {
  return HCMPoint_intersectSimpleWithHCMPoint_withHCMPoint_withHCMPoint_withHCMPoint_(p, p2, q, q2);
}

- (void)copyAllFieldsTo:(HCMPoint *)other {
  [super copyAllFieldsTo:other];
  other->latitude_ = latitude_;
  other->longitude_ = longitude_;
  other->speed_ = speed_;
  other->bearing_ = bearing_;
  other->hAccuracy_ = hAccuracy_;
  other->vAccuracy_ = vAccuracy_;
  other->timestamp_ = timestamp_;
  other->lapDistance_ = lapDistance_;
  other->lapTime_ = lapTime_;
  other->acceleration_ = acceleration_;
  other->splitTime_ = splitTime_;
  other->generated_ = generated_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithDouble:withDouble:withBoolean:", "Point", NULL, 0x1, NULL },
    { "initWithDouble:withDouble:", "Point", NULL, 0x1, NULL },
    { "initWithDouble:withDouble:withDouble:", "Point", NULL, 0x1, NULL },
    { "initWithDouble:withDouble:withDouble:withDouble:withDouble:withDouble:withDouble:", "Point", NULL, 0x1, NULL },
    { "isEqual:", "equals", "Z", 0x1, NULL },
    { "description", "toString", "Ljava.lang.String;", 0x1, NULL },
    { "setLapTimeWithDouble:withDouble:", "setLapTime", "V", 0x1, NULL },
    { "roundValueWithDouble:", "roundValue", "D", 0x2, NULL },
    { "getLatitudeDegrees", NULL, "D", 0x1, NULL },
    { "getLongitudeDegrees", NULL, "D", 0x1, NULL },
    { "subtractWithHCMPoint:", "subtract", "Lharrycheung.map.Point;", 0x1, NULL },
    { "bearingToWithHCMPoint:withBoolean:", "bearingTo", "D", 0x1, NULL },
    { "bearingToWithHCMPoint:", "bearingTo", "D", 0x1, NULL },
    { "destinationWithDouble:withDouble:", "destination", "Lharrycheung.map.Point;", 0x1, NULL },
    { "distanceToWithHCMPoint:", "distanceTo", "D", 0x1, NULL },
    { "intersectSimpleWithHCMPoint:withHCMPoint:withHCMPoint:withHCMPoint:", "intersectSimple", "Lharrycheung.map.Point;", 0x9, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "RADIUS_", NULL, 0x1a, "D", NULL, .constantValue.asDouble = HCMPoint_RADIUS },
    { "latitude_", NULL, 0x4, "D", NULL,  },
    { "longitude_", NULL, 0x4, "D", NULL,  },
    { "speed_", NULL, 0x1, "D", NULL,  },
    { "bearing_", NULL, 0x1, "D", NULL,  },
    { "hAccuracy_", NULL, 0x1, "D", NULL,  },
    { "vAccuracy_", NULL, 0x1, "D", NULL,  },
    { "timestamp_", NULL, 0x1, "D", NULL,  },
    { "lapDistance_", NULL, 0x1, "D", NULL,  },
    { "lapTime_", NULL, 0x1, "D", NULL,  },
    { "acceleration_", NULL, 0x1, "D", NULL,  },
    { "splitTime_", NULL, 0x1, "D", NULL,  },
    { "generated_", NULL, 0x1, "Z", NULL,  },
  };
  static const J2ObjcClassInfo _HCMPoint = { 1, "Point", "harrycheung.map", NULL, 0x1, 16, methods, 13, fields, 0, NULL};
  return &_HCMPoint;
}

@end

jdouble HCMPoint_roundValueWithDouble_(HCMPoint *self, jdouble value) {
  return JavaLangMath_roundWithDouble_(value * 1000000.0) / 1000000.0;
}

HCMPoint *HCMPoint_intersectSimpleWithHCMPoint_withHCMPoint_withHCMPoint_withHCMPoint_(HCMPoint *p, HCMPoint *p2, HCMPoint *q, HCMPoint *q2) {
  HCMPoint_init();
  jdouble s1_x = ((HCMPoint *) nil_chk(p2))->longitude_ - ((HCMPoint *) nil_chk(p))->longitude_;
  jdouble s1_y = p2->latitude_ - p->latitude_;
  jdouble s2_x = ((HCMPoint *) nil_chk(q2))->longitude_ - ((HCMPoint *) nil_chk(q))->longitude_;
  jdouble s2_y = q2->latitude_ - q->latitude_;
  jdouble den = (-s2_x * s1_y + s1_x * s2_y);
  if (den == 0) {
    return nil;
  }
  jdouble s = (-s1_y * (p->longitude_ - q->longitude_) + s1_x * (p->latitude_ - q->latitude_)) / den;
  jdouble t = (s2_x * (p->latitude_ - q->latitude_) - s2_y * (p->longitude_ - q->longitude_)) / den;
  if (s >= 0 && s <= 1 && t >= 0 && t <= 1) {
    return [[[HCMPoint alloc] initWithDouble:p->latitude_ + (t * s1_y) withDouble:p->longitude_ + (t * s1_x) withBoolean:YES] autorelease];
  }
  return nil;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(HCMPoint)
