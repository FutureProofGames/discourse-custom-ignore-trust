# name: discourse-custom-ignore-trust
# about: allows customization of ignore functionality
# version: 1.0.0
# authors: Gregory Avery-Weir

module GuardianIgnoreExtension
  def can_ignore_users?
    return false if anonymous?
    @user.staff? || @user.trust_level >= SiteSetting.custom_ignore_trust_level
  end
end

class ::Guardian
  prepend GuardianIgnoreExtension
end

module PurgeExpiredIgnoredUsersExtension
  def execute(args)
    if SiteSetting.custom_ignore_no_limit
      IgnoredUser.where("expiring_at <= ?", Time.zone.now).delete_all
    else
      super(args)
    end
  end
end

class ::PurgeExpiredIgnoredUsers 
  prepend PurgeExpiredIgnoredUsersExtension
end
